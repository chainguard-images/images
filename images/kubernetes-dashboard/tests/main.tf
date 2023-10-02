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

  // After v6.0.8 the image tag is used as a K8s label, which has a max length of 63 characters.
  version = "6.0.8"

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

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.kubernetes-dashboard.id
  namespace = helm_release.kubernetes-dashboard.namespace
}
