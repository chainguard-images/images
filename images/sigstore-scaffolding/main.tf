terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  components = toset([
    "cloudsqlproxy",
    "ctlog-createctconfig",
    "ctlog-managectroots",
    "ctlog-verifyfulcio",
    "fulcio-createcerts",
    "getoidctoken",
    "rekor-createsecret",
    "trillian-createdb",
    "trillian-createtree",
    "trillian-updatetree",
    "tsa-createcertchain",
    "tuf-createsecret",
    "tuf-server",
  ])
}

module "config" {
  for_each = local.components
  source   = "./config"
  name     = each.key
}

module "latest" {
  for_each = local.components
  source   = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = "${var.target_repository}-${each.key}"
  config            = module.config[each.key].config
  build-dev         = true
}

module "test-latest" {
  source             = "./tests"
  scaffolding-images = { for k, v in module.latest : k => v.image_ref }
}

resource "oci_tag" "latest" {
  for_each   = local.components
  depends_on = [module.test-latest]
  digest_ref = module.latest[each.key].image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  for_each   = local.components
  depends_on = [module.test-latest]
  digest_ref = module.latest[each.key].dev_ref
  tag        = "latest-dev"
}
