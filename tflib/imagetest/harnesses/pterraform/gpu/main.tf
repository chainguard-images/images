terraform {
  required_providers {
    google = { source = "hashicorp/google" }
    tls    = { source = "hashicorp/tls" }
    random = { source = "hashicorp/random" }
    oci    = { source = "chainguard-dev/oci" }
    cosign = { source = "chainguard-dev/cosign" }
    local  = { source = "hashicorp/local" }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
  default_labels = {
    "harness" = var.name
    "owner"   = "imagetest"
  }
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

locals {
  name   = "${var.name}-${random_string.suffix.result}"
  parsed = provider::oci::parse(var.image_ref)
  split  = split("/", local.parsed.repo)
  last   = local.split[length(local.split) - 1]
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  filename        = "${path.module}/${local.name}-private_key.pem"
  content         = tls_private_key.this.private_key_pem
  file_permission = "0600"
}

resource "google_service_account" "default" {
  project      = var.project
  account_id   = "${local.name}-default"
  display_name = "Default SA for ${local.name}"
}

resource "google_artifact_registry_repository" "this" {
  project       = var.project
  repository_id = local.name
  format        = "DOCKER"
  description   = "Temporary repository for ${local.name} imagetest harness"
}

resource "google_artifact_registry_repository_iam_member" "viewer" {
  project    = var.project
  repository = google_artifact_registry_repository.this.id
  role       = "roles/artifactregistry.reader"
  member     = "serviceAccount:${google_service_account.default.email}"
}

# Use the client's credentials to copy the image to a known location where the
# harness can pull from it
resource "cosign_copy" "copy" {
  source      = var.image_ref
  destination = "${google_artifact_registry_repository.this.location}-docker.pkg.dev/${google_artifact_registry_repository.this.project}/${google_artifact_registry_repository.this.repository_id}/${local.last}"
}

module "startup-scripts" {
  source  = "terraform-google-modules/startup-scripts/google"
  version = "~> 2.0"

  enable_setup_sudoers = true
}

resource "google_compute_network" "this" {
  project                 = var.project
  name                    = "${local.name}-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "this" {
  project = var.project
  name    = "${local.name}-subnetwork"
  network = google_compute_network.this.id

  ip_cidr_range = "10.0.0.0/16"
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "${local.name}-allow-ssh"
  network = google_compute_network.this.id
  project = var.project

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # TODO: Restrict this to only the client
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "this" {
  project      = var.project
  zone         = var.zone
  name         = local.name
  machine_type = var.machine_type

  can_ip_forward = false

  boot_disk {
    auto_delete = true
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }

  network_interface {
    network    = google_compute_network.this.id
    subnetwork = google_compute_subnetwork.this.id

    access_config {
      // Ephemeral Public IP
    }
  }

  metadata = {
    ssh-keys                = "${local.name}:${tls_private_key.this.public_key_openssh}"
    enable-guest-attributes = "TRUE"
    startup-script          = module.startup-scripts.content
    startup-script-custom = templatefile("${path.module}/startup.sh.tftpl", {
      name      = local.name
      image_ref = "${cosign_copy.copy.destination}@${local.parsed.digest}"
      mounts    = var.mounts
      envs      = var.envs
      location  = google_artifact_registry_repository.this.location
    })

    # https://github.com/terraform-google-modules/terraform-google-startup-scripts/blob/master/files/setup_sudoers.sh
    sudoers = local.name
  }

  guest_accelerator {
    type  = "nvidia-tesla-t4"
    count = 1
  }

  scheduling {
    on_host_maintenance = "TERMINATE"
    automatic_restart   = false
  }

  service_account {
    email = google_service_account.default.email
    scopes = [
      # "cloud-platform",

      # For pulling images from GAR
      "storage-ro",
      # For posting status to instance's metadata
      "compute-rw",

      "logging-write",
      "monitoring",
    ]
  }
}

# Block until the instance posts a status of "completed" in its metadata
resource "terraform_data" "wait_for_completion" {
  depends_on = [google_compute_instance.this]

  provisioner "local-exec" {
    command = <<EOF
max_retries=30
wait=10
retry_count=0

while [ $retry_count -lt $max_retries ]; do
  status=$(gcloud compute instances get-guest-attributes ${local.name} --zone=${google_compute_instance.this.zone} --project=${google_compute_instance.this.project} --format json | jq -r '.[] | select(.namespace == "imagetest" and .key == "status").value')

  if [ "$status" = "completed" ]; then
    echo "Process completed successfully."
    exit 0
  elif [ "$status" = "failed" ]; then
    echo "Process failed."
    exit 1
  else
    echo "Waiting for completion... (Attempt $((retry_count + 1))/$max_retries)"
    sleep $wait
    retry_count=$((retry_count + 1))
  fi
done

echo "Process did not complete within the allowed retries."
exit 1
    EOF
  }
}

output "instance_name" {
  value = local.name
}

output "instance_ip" {
  value = google_compute_instance.this.network_interface.0.access_config.0.nat_ip
}

output "ssh_command" {
  value = "ssh -i ${local_file.private_key.filename} ${local.name}@${google_compute_instance.this.network_interface.0.access_config.0.nat_ip}"
}

output "connection" {
  value = {
    docker = {
      cid              = local.name
      host             = "ssh://${local.name}@${google_compute_instance.this.network_interface.0.access_config.0.nat_ip}"
      private_key_path = local_file.private_key.filename
    }

    # The wait_for_completion resource will block until the container is
    # running, the retry here is strictly to weed out connection flakes.
    retry = {
      attempts = 10
      delay    = "5s"
    }
  }
}
