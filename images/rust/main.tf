terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" { source = "./config" }

module "rust" {
  source             = "../../tflib/publisher"
  name               = basename(path.module)
  target_repository  = var.target_repository
  config             = module.config.config
  build-dev          = true
  extra_dev_packages = ["rustup"]
}

module "test" {
  source = "./tests"
  digest = module.rust.image_ref
}

module "test-dev" {
  source    = "./tests"
  digest    = module.rust.dev_ref
  check-dev = true
}

resource "oci_tag" "latest" {
  depends_on = [module.test]
  digest_ref = module.rust.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test-dev]
  digest_ref = module.rust.dev_ref
  tag        = "latest-dev"
}

