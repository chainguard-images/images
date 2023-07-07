terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

resource "helm_release" "kubewatch" {
  name = "kubewatch"

  repository = "https://robusta-charts.storage.googleapis.com"
  chart      = "kubewatch"

  namespace        = "kubewatch"
  create_namespace = true

  values = [
    jsonencode({
      image = {
        registry   = data.oci_string.ref.registry
        repository = data.oci_string.ref.repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }),
  ]
}
