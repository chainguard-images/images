terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

locals {
  components = toset(["velero-plugin-for-aws"])
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  for_each       = local.components
  source         = "./config"
  extra_packages = [each.key, "${each.key}-compat"]
}

module "velero-plugin-for-aws" {
  for_each          = local.components
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config[each.key].config

  build-dev    = true
  main_package = each.key
}

locals { velero = provider::oci::get("cgr.dev/chainguard/velero:latest") }

module "test" {
  source = "./tests"
  digests = {
    velero                = local.velero.full_ref
    velero-plugin-for-aws = module.velero-plugin-for-aws["velero-plugin-for-aws"].image_ref
  }
  target_repository = var.target_repository
}

resource "oci_tag" "latest" {
  for_each   = local.components
  depends_on = [module.test]
  digest_ref = module.velero-plugin-for-aws[each.key].image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  for_each   = local.components
  depends_on = [module.test]
  digest_ref = module.velero-plugin-for-aws[each.key].dev_ref
  tag        = "latest-dev"
}

