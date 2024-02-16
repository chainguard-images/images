terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "pre-busl-config" {
  source         = "./config"
  extra_packages = ["terraform<1.6"]
}

module "latest-busl-config" {
  source         = "./config"
  extra_packages = ["terraform"]
}

module "pre-busl" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.pre-busl-config.config
  build-dev         = true
}

module "test-pre-busl" {
  source = "./tests"
  digest = module.pre-busl.image_ref
}

module "latest-busl" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.latest-busl-config.config
  build-dev         = true
}

module "test-latest-busl" {
  source = "./tests"
  digest = module.latest-busl.image_ref
}

resource "oci_tag" "latest-busl" {
  depends_on = [module.test-latest-busl]
  digest_ref = module.latest-busl.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-busl-dev" {
  depends_on = [module.test-latest-busl]
  digest_ref = module.latest-busl.dev_ref
  tag        = "latest-dev"
}

locals { pre_busl_tags = toset(["1.5.7", "1.5", "latest-mpl"]) }

resource "oci_tag" "pre-busl" {
  for_each   = local.pre_busl_tags
  depends_on = [module.test-pre-busl]
  digest_ref = module.pre-busl.image_ref
  tag        = each.key
}

resource "oci_tag" "pre-busl-dev" {
  for_each   = local.pre_busl_tags
  depends_on = [module.test-pre-busl]
  digest_ref = module.pre-busl.dev_ref
  tag        = "${each.key}-dev"
}
