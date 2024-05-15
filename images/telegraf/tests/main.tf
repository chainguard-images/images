terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

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
        repo = local.parsed.registry_repo
        tag  = local.parsed.pseudo_tag
      }
    }),
  ]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.telegraf.id
  namespace = helm_release.telegraf.namespace
}
