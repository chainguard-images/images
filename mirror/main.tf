terraform {
  required_providers {
    google = { source = "hashicorp/google" }
  }
}

provider "google" {
  project = var.project
}

data "google_project" "project" {
}

// Create a service account for the bot.
resource "google_service_account" "sa" {
  account_id   = var.service-account
  display_name = "Image Mirror Bot"
}

// Create a root repo for things to publish to.
resource "google_artifact_registry_repository" "root" {
  location      = var.location
  repository_id = "mirror"
  format        = "DOCKER"
}

// Allow anybody to pull images from the mirror.
resource "google_artifact_registry_repository_iam_member" "public-pull" {
  project    = google_artifact_registry_repository.root.project
  location   = google_artifact_registry_repository.root.location
  repository = google_artifact_registry_repository.root.name
  role       = "roles/artifactregistry.reader"
  member     = "allUsers"
}

// Allow the SA to push to the repos.
resource "google_artifact_registry_repository_iam_member" "sa-push" {
  project    = google_artifact_registry_repository.root.project
  location   = google_artifact_registry_repository.root.location
  repository = google_artifact_registry_repository.root.name
  role       = "roles/artifactregistry.writer"
  member     = "serviceAccount:${google_service_account.sa.email}"
}

// Allow the GH OIDC token to act as the SA.
module "gh_oidc" {
  source      = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  project_id  = var.project
  pool_id     = "gha-pool2"
  provider_id = "gha-pool-provider"
  sa_mapping = {
    "${google_service_account.sa.name}" = {
      sa_name   = google_service_account.sa.name
      attribute = "attribute.repository/${var.github-repo}"
    }
  }
}
