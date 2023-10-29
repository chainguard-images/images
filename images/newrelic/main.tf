terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

locals {
  components = toset([
    "infrastructure-bundle",
    "fluent-bit-output",
    "k8s-events-forwarder",
    "prometheus-configurator",
    "kube-events",
    "kubernetes",
    "prometheus",
  ])

  repositories = merge(
    { for k, v in local.components : k => "${var.target_repository}-${k}" },
  )
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

variable "license_key" {}

module "config" {
  for_each = local.components
  source   = "./configs"
  name     = each.key
}

module "latest" {
  for_each = local.repositories
  source   = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = each.value
  config            = module.config[each.key].config
  build-dev         = true
}

module "test-latest" {
  source = "./tests"

  digests     = { for k, v in module.latest : k => v.image_ref }
  license_key = var.license_key
}

resource "oci_tag" "latest" {
  for_each = local.components

  digest_ref = module.latest[each.key].image_ref
  tag        = "latest"
  depends_on = [module.test-latest]
}

resource "oci_tag" "latest-dev" {
  for_each = local.components

  digest_ref = module.latest[each.key].dev_ref
  tag        = "latest-dev"
  depends_on = [module.test-latest]
}
