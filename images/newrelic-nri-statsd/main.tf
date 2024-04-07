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

module "newrelic-nri-statsd" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config.config

  build-dev    = true
  main_package = "newrelic-nri-statsd"
}

module "test" {
  source      = "./tests"
  digest      = module.newrelic-nri-statsd.image_ref
  license_key = var.license_key
}

resource "oci_tag" "latest" {
  depends_on = [module.test]
  digest_ref = module.newrelic-nri-statsd.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test]
  digest_ref = module.newrelic-nri-statsd.dev_ref
  tag        = "latest-dev"
}

