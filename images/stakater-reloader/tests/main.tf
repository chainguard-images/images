terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "helm_release" "stakater-reloader" {
  name = "stakater-reloader"

  repository = "https://stakater.github.io/stakater-charts"
  chart      = "reloader"

  namespace        = "stakater-reloader"
  create_namespace = true

  values = [jsonencode({
    reloader = {
      deployment = {
        image = {
          tag  = data.oci_string.ref.pseudo_tag
          name = data.oci_string.ref.registry_repo
        }
      }
    }
  })]
}
