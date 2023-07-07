terraform {
  required_providers {
    oci    = { source = "chainguard-dev/oci" }
    random = { source = "hashicorp/random" }
    helm   = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digest to run tests over."
  type = object({
    dashboard       = string
    metrics-scraper = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

resource "random_pet" "suffix" {}

resource "helm_release" "kubernetes-dashboard" {
  name = "kubernetes-dashboard-${random_pet.suffix.id}"

  repository = "https://kubernetes.github.io/dashboard/"
  chart      = "kubernetes-dashboard"

  namespace        = "kubernetes-dashboard-${random_pet.suffix.id}"
  create_namespace = true

  values = [jsonencode({
    image = {
      tag        = data.oci_string.ref["dashboard"].pseudo_tag
      repository = data.oci_string.ref["dashboard"].registry_repo
    }
    metricsScraper = {
      image = {
        tag        = data.oci_string.ref["metrics-scraper"].pseudo_tag
        repository = data.oci_string.ref["metrics-scraper"].registry_repo
      }
      enabled = true
    }
  })]
}
