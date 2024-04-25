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
    "local-static-provisioner",
  ]
}

module "config" {
  for_each       = toset(local.components)
  source         = "./config"
  extra_packages = [each.key, "${each.key}-compat"]
}

module "local-volume-provisioner" {
  for_each          = toset(local.components)
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config[each.key].config

  build-dev    = true
  main_package = each.key
}

module "test" {
  for_each = toset(local.components)
  source   = "./tests"
  digest   = module.local-volume-provisioner[each.key].image_ref
}

resource "oci_tag" "latest" {
  for_each   = toset(local.components)
  depends_on = [module.test]
  digest_ref = module.local-volume-provisioner[each.key].image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  for_each   = toset(local.components)
  depends_on = [module.test]
  digest_ref = module.local-volume-provisioner[each.key].dev_ref
  tag        = "latest-dev"
}

