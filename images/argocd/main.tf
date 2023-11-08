terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  components = toset(["server", "repo-server"])
}

module "config" {
  for_each = local.components
  source   = "./configs"
  name     = each.key
}

module "latest" {
  for_each = local.components
  source   = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = (each.key == "server" ? var.target_repository : "${var.target_repository}-repo-server")
  config            = module.config[each.key].config
  build-dev         = true
}

module "test-latest" {
  source  = "./tests"
  digests = { for k, v in module.latest : k => v.image_ref }
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
