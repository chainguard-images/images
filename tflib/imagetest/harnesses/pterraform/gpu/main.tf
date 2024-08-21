terraform {
  required_providers {
    google = {}
    tls    = {}
    random = {}
  }
}

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

locals { name = "${var.name}-${random_string.suffix.result}" }

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
  account_id   = "${local.name}-default"
  display_name = "Default SA for ${local.name}"
}

module "startup-scripts" {
  source  = "terraform-google-modules/startup-scripts/google"
  version = "~> 2.0"

  enable_setup_sudoers = true
}

resource "google_compute_network" "this" {
  name                    = "${local.name}-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "this" {
  name    = "${local.name}-subnetwork"
  network = google_compute_network.this.id

  ip_cidr_range = "10.0.0.0/16"
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "${local.name}-allow-ssh"
  network = google_compute_network.this.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  # TODO: Restrict this to only the client
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "this" {
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
    ssh-keys              = "${local.name}:${tls_private_key.this.public_key_openssh}"
    startup-script        = module.startup-scripts.content
    startup-script-custom = <<EO_startup
stdlib::info "Installing GPU drivers"
stdlib::cmd sudo cos-extensions install gpu

stdlib::info "Starting harness image ${var.image_ref}"
stdlib::cmd docker run -d  --name "${local.name}" --entrypoint "bash" \
  --volume /var/lib/nvidia/lib64:/usr/local/nvidia/lib64 \
  --volume /var/lib/nvidia/bin:/usr/local/nvidia/bin \
  --device /dev/nvidia0:/dev/nvidia0 \
  --device /dev/nvidia-uvm:/dev/nvidia-uvm \
  --device /dev/nvidiactl:/dev/nvidiactl \
  ${var.image_ref} -c "sleep inf"

stdlib::info "Setting startup-script-status to completed"
stdlib::cmd curl -X PUT -H "Metadata-Flavor: Google" \
     -d "completed" \
     http://metadata.google.internal/computeMetadata/v1/instance/attributes/startup-script-status
EO_startup
  }

  guest_accelerator = [
    {
      type  = "nvidia-tesla-t4"
      count = 1
    }
  ]

  scheduling {
    on_host_maintenance = "TERMINATE"
    automatic_restart   = false
  }

  service_account {
    email = google_service_account.default.email
    scopes = [
      "cloud-platform",
    ]
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

    retry = {
      attempts = 30
      delay    = "5s"
    }
  }
}
