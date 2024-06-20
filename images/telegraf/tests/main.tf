terraform {
  required_providers {
    helm = { source = "hashicorp/helm" }
    oci  = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals {
  parsed = provider::oci::parse(var.digest)
}

resource "random_pet" "suffix" {
}

resource "helm_release" "telegraf" {
  chart            = "telegraf"
  create_namespace = true
  name             = "telegraf-${random_pet.suffix.id}"
  namespace        = "telegraf-${random_pet.suffix.id}"
  repository       = "https://helm.influxdata.com"
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
  name      = helm_release.telegraf.id
  namespace = helm_release.telegraf.namespace
  source    = "../../../tflib/helm-cleanup"
}

