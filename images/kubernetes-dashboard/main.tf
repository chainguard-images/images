terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

locals {
  components = toset(["dashboard", "metrics-scraper"])
}

module "dashboard-config" { source = "./config/dashboard" }
module "metrics-scraper-config" { source = "./config/metrics-scraper" }

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest" {
  for_each          = local.components
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = (each.key == "dashboard" ? "${var.target_repository}" : "${var.target_repository}-${each.key}")
  config            = (each.key == "dashboard" ? module.dashboard-config.config : module.metrics-scraper-config.config)
  build-dev         = true
}

module "test-latest" {
  source  = "./tests"
  digests = { for k, v in module.latest : k => v.image_ref }
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
