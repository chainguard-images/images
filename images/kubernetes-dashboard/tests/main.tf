terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
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

resource "helm_release" "kubernetes-dashboard" {
  name = "kubernetes-dashboard"

  repository = "https://kubernetes.github.io/dashboard/"
  chart      = "kubernetes-dashboard"

  namespace        = "kubernetes-dashboard"
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
