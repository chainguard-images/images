terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  components = {
    "server" : {
      package    = "redis"
      repository = var.target_repository
    }
    "cluster" : {
      package    = "redis"
      repository = "${var.target_repository}-cluster"
    }
    "sentinel" : {
      package    = "redis"
      repository = "${var.target_repository}-sentinel"
    }
  }
}

module "config" {
  for_each = local.components
  source   = "./configs"
  name     = each.value.package
}

module "latest" {
  for_each = local.components
  source   = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = each.value.repository
  config            = module.config[each.key].config
  build-dev         = true
}

module "test-latest" {
  source  = "./tests"
  digests = { for k, v in module.latest : k => v.image_ref }
}

resource "oci_tag" "latest" {
  for_each = local.components
  # depends_on = [module.test-latest]
  digest_ref = module.latest[each.key].image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  for_each = local.components
  # depends_on = [module.test-latest]
  digest_ref = module.latest[each.key].dev_ref
  tag        = "latest-dev"
}
