terraform {
  required_providers {
    google  = { source = "hashicorp/google" }
    kubectl = { source = "gavinbunney/kubectl" }
    random  = { source = "hashicorp/random" }
  }
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

variable "digest" {
  description = "The image digest to run tests over."
  default     = "cgr.dev/chainguard/secrets-store-csi-driver-provider-gcp"
}

variable "gcp_project" {
  description = "If set, GCP project to run e2e tests in"
}

variable "gcp_region" {
  description = "If set, GCP region to run e2e tests in"
  default     = "us-central1"
}

// Create a GSA.
resource "google_service_account" "sa" {
  account_id   = "csi-driver-sa"
  display_name = "Service Account for testing Secrets Store CSI Driver Provider for GCP"
}

// Create a cluster running as the GSA.
resource "google_container_cluster" "cluster" {
  depends_on = [google_service_account_iam_member.workload-identity-bindings]
  location   = var.gcp_region

  name = "secrets-store-csi-driver-provider-gcp"

  node_config {
    service_account = google_service_account.sa.email
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
    preemptible     = true
    machine_type    = "e2-medium"
  }
  workload_identity_config {
    workload_pool = "${var.gcp_project}.svc.id.goog"
  }
  initial_node_count = 1
}

// Create a secret in the region.
resource "google_secret_manager_secret" "secret" {
  secret_id = "csi-driver-secret"
  replication {
    automatic = true
  }
}

// Fill in some secret data.
resource "google_secret_manager_secret_version" "secret-version" {
  secret = google_secret_manager_secret.secret.id

  secret_data = "s3cr3t"
}

// GSA can access the secret
resource "google_secret_manager_secret_iam_binding" "binding" {
  project   = var.gcp_project
  secret_id = google_secret_manager_secret.secret.secret_id
  role      = "roles/secretmanager.secretAccessor"
  members = [
    "serviceAccount:${google_service_account.sa.email}",
  ]
}

// The KSA can act as the GSA.
resource "google_service_account_iam_member" "workload-identity-bindings" {
  service_account_id = google_service_account.sa.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "serviceAccount:${var.gcp_project}.svc.id.goog[default/default]"
}

data "google_client_config" "provider" {}

provider "kubectl" {
  cluster_ca_certificate = base64decode(google_container_cluster.cluster.master_auth[0].cluster_ca_certificate)
  host                   = "https://${google_container_cluster.cluster.endpoint}"
  token                  = data.google_client_config.provider.access_token
}

// Install the CSI driver.
data "kubectl_path_documents" "manifests" {
  pattern = "${path.module}/manifests/*.yaml"
}
resource "kubectl_manifest" "manifests" {
  count     = length(data.kubectl_path_documents.manifests.documents)
  yaml_body = element(data.kubectl_path_documents.manifests.documents, count.index)
}

// Install the GCP provider, with our image.
data "kubectl_file_documents" "gcp-provider-manifests" {
  content = templatefile("${path.module}/manifests/provider-gcp-plugin.yaml.tpl", {
    gcp_provider_image = var.digest
  })
}
resource "kubectl_manifest" "gcp-provider-manifests" {
  depends_on = [kubectl_manifest.manifests]
  count      = length(data.kubectl_file_documents.gcp-provider-manifests.documents)
  yaml_body  = element(data.kubectl_file_documents.gcp-provider-manifests.documents, count.index)
}

// Define the provider class.
resource "kubectl_manifest" "secret-provider-class" {
  depends_on = [kubectl_manifest.manifests]
  yaml_body = templatefile("${path.module}/manifests/secretproviderclass.yaml.tpl", {
    secret_name = google_secret_manager_secret_version.secret-version.name
  })
}

// Define the KSA, annotated with the GSA.
resource "kubectl_manifest" "ksa" {
  depends_on = [kubectl_manifest.secret-provider-class]
  yaml_body = templatefile("${path.module}/manifests/serviceaccount.yaml.tpl", {
    sa_email = google_service_account.sa.email
  })
}

// Run a Pod that logs the secret data.
resource "random_pet" "suffix" {}
resource "kubectl_manifest" "pod" {
  depends_on = [kubectl_manifest.ksa]
  yaml_body = templatefile("${path.module}/manifests/pod.yaml.tpl", {
    random_id = random_pet.suffix.id
  })
}

// Get the Pod's logs, and look for the secret data.
data "external" "logs" {
  depends_on = [kubectl_manifest.pod]
  program    = ["${path.module}/grep-pod-logs.sh"]
  query = {
    pod_name    = kubectl_manifest.pod.name
    secret_data = google_secret_manager_secret_version.secret-version.secret_data
  }
}

output "logs" {
  value = data.external.logs.result.logs
}
