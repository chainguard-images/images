terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

locals {
  components = toset(["prometheus-blackbox-exporter"])
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  for_each       = local.components
  source         = "./config"
  extra_packages = [each.key, "${each.key}-compat"]
}

module "latest" {
  for_each          = local.components
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config[each.key].config

  build-dev    = true
  main_package = each.key
}

module "test" {
  for_each      = local.components
  source        = "./tests"
  digest        = module.latest[each.key].image_ref
  chart_version = "8.10.0"
}

resource "oci_tag" "latest" {
  for_each   = local.components
  depends_on = [module.test]
  digest_ref = module.latest[each.key].image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  for_each   = local.components
  depends_on = [module.test]
  digest_ref = module.latest[each.key].dev_ref
  tag        = "latest-dev"
}

