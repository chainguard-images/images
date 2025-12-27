terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  version = "4.0"
}

module "latest-config" {
  source         = "./config"
  extra_packages = ["ruby-${local.version}"]
}

module "latest" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.latest-config.config
  extra_dev_packages = [
    "build-base",
    "ruby-${local.version}-dev",
    "ruby${local.version}-bundler",
  ]
}

module "test-latest" {
  source            = "./tests"
  digest            = module.latest.image_ref
  target_repository = var.target_repository
  name              = "ruby-public-latest"
}

module "tagger" {
  depends_on = [module.test-latest]
  source     = "../../tflib/tagger"
  tags = {
    "latest"     = module.latest.image_ref
    "latest-dev" = module.latest.dev_ref
  }
}
