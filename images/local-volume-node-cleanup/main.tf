terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  components = [
    "local-volume-node-cleanup",
  ]
}

module "config" {
  for_each       = toset(local.components)
  source         = "./config"
  extra_packages = [each.key, "${each.key}-compat"]
}

module "local-volume-node-cleanup" {
  for_each          = toset(local.components)
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config[each.key].config

  build-dev    = true
  main_package = each.key
}

locals { provisioner = provider::oci::get("cgr.dev/chainguard/local-volume-provisioner:latest") }

module "test" {
  for_each = toset(local.components)
  source   = "./tests"
  digests = {
    local-volume-provisioner  = local.provisioner.full_ref
    local-volume-node-cleanup = module.local-volume-node-cleanup[each.key].image_ref
  }
}

resource "oci_tag" "latest" {
  for_each   = toset(local.components)
  depends_on = [module.test]
  digest_ref = module.local-volume-node-cleanup[each.key].image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  for_each   = toset(local.components)
  depends_on = [module.test]
  digest_ref = module.local-volume-node-cleanup[each.key].dev_ref
  tag        = "latest-dev"
}

