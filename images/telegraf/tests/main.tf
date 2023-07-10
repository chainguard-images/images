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

resource "helm_release" "telegraf" {
  name = "telegraf"

  repository = "https://helm.influxdata.com"
  chart      = "telegraf"

  namespace        = "telegraf"
  create_namespace = true

  values = [
    jsonencode({
      image = {
        repo = data.oci_string.ref.registry_repo
        tag  = data.oci_string.ref.pseudo_tag
      }
    }),
  ]
}
