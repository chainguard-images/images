terraform {
  required_providers {
    oci    = { source = "chainguard-dev/oci" }
    random = { source = "hashicorp/random" }
    helm   = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

resource "random_pet" "suffix" {}

resource "helm_release" "scraper" {
  name = "scraper-${random_pet.suffix.id}"

  repository = "https://kubernetes.github.io/dashboard/"
  chart      = "kubernetes-dashboard"

  namespace        = "stakater-reloader-${random_pet.suffix.id}"
  create_namespace = true

  # Split the digest ref into repository and digest. The helm chart expects a
  # tag, but it just appends it to the repository again, so we just specify a
  # dummy tag and the digest to test.
  set {
    name  = "metricsScraper.image.tag"
    value = "unused@${element(split("@", var.digest), 1)}"
  }
  set {
    name  = "metricsScraper.image.repository"
    value = element(split("@", var.digest), 0)
  }
  set {
    name  = "metricsScraper.enabled"
    value = "true"
  }
}
