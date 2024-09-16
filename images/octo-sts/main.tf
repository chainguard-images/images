terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  packages = {
    // Map package -> binary
    "octo-sts"         = "octo-sts",
    "octo-sts-webhook" = "webhook"
  }

  repo = {
    "octo-sts"         = var.target_repository
    "octo-sts-webhook" = "${var.target_repository}-webhook"
  }
}

module "latest-config" {
  for_each = local.packages

  source         = "./config"
  extra_packages = [each.key]
  binary         = each.value
}

module "latest" {
  for_each = local.packages

  source            = "../../tflib/publisher"
  name              = each.key
  target_repository = local.repo[each.key]
  main_package      = each.key
  config            = module.latest-config[each.key].config
  build-dev         = true
}

module "test-latest" {
  for_each = local.packages

  source = "./tests"
  digest = module.latest[each.key].image_ref
}

resource "oci_tag" "latest" {
  for_each = local.packages

  depends_on = [module.test-latest]
  digest_ref = module.latest[each.key].image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  for_each = local.packages

  depends_on = [module.test-latest]
  digest_ref = module.latest[each.key].dev_ref
  tag        = "latest-dev"
}
