terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest-config" { source = "./config" }

module "latest" {
  source             = "../../tflib/publisher"
  name               = basename(path.module)
  target_repository  = var.target_repository
  config             = module.latest-config.config
  extra_dev_packages = ["composer"]
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
}

module "test-latest-dev" {
  source    = "./tests"
  check-dev = true # Check for PIP in dev variants.
  digest    = module.latest.dev_ref
}

resource "oci_tag" "latest" {
  depends_on = [module.test-latest]
  digest_ref = module.latest.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test-latest-dev]
  digest_ref = module.latest.dev_ref
  tag        = "latest-dev"
}
