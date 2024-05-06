terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  components = toset(["bulker", "ingest", "syncctl"])

  // Normally the repository is named like "jitsucom-{component}".
  repositories = {
    for k, v in local.components : k => "${var.target_repository}-${k}"
  }
}

module "config" {
  for_each     = local.components
  source       = "./config"
  main_package = each.key
}

module "latest" {
  for_each = local.components
  source   = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = local.repositories[each.key]
  config            = module.config[each.key].config
  build-dev         = true
}

module "test" {
  source  = "./tests"
  digests = { for k, v in module.latest : k => v.image_ref }
}

resource "oci_tag" "latest" {
  for_each = local.components

  digest_ref = module.latest[each.key].image_ref
  tag        = "latest"
  depends_on = [module.test]
}

resource "oci_tag" "latest-dev" {
  for_each = local.components

  digest_ref = module.latest[each.key].dev_ref
  tag        = "latest-dev"
  depends_on = [module.test]
}
