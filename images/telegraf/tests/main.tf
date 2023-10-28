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

resource "random_pet" "suffix" {}

resource "helm_release" "telegraf" {
  name = "telegraf-${random_pet.suffix.id}"

  repository = "https://helm.influxdata.com"
  chart      = "telegraf"

  namespace        = "telegraf-${random_pet.suffix.id}"
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

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.telegraf.id
  namespace = helm_release.telegraf.namespace
}
