terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  components = toset(["dask-gateway", "dask-gateway-server"])

  // target_repository is going to be something like `cgr.dev/chainguard/dask-gateway`,
  // so append this suffix to get the full repo name.
  repositories = {
    "dask-gateway" : var.target_repository,
    "dask-gateway-server" : "${var.target_repository}-server",
  }
}

module "config" {
  for_each     = local.components
  source       = "./config"
  main_package = each.key
}

module "latest" {
  for_each          = local.components
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = local.repositories[each.key]
  config            = module.config[each.key].config
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
