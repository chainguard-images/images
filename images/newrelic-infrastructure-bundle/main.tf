terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" { source = "./config" }

variable "license_key" {}

module "newrelic-infrastructure-bundle" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config.config
  build-dev         = true
}

module "test" {
  source      = "./tests"
  digest      = module.newrelic-infrastructure-bundle.image_ref
  license_key = var.license_key
}

resource "oci_tag" "latest" {
  depends_on = [module.test]
  digest_ref = module.newrelic-infrastructure-bundle.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test]
  digest_ref = module.newrelic-infrastructure-bundle.dev_ref
  tag        = "latest-dev"
}

