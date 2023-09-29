terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  fluentd_dev = [
    "build-base",
    "ruby3.2-bundler",
    "ruby-3.2-dev",
  ]

  splunk = [
    "ruby3.2-fluent-plugin-splunk-hec",
    "ruby3.2-fluent-plugin-prometheus",
    "ruby3.2-fluent-plugin-rewrite-tag-filter",
    "net-tools", # hostname command is required by rewrite-tag-filter plugin
  ]
}

module "latest-config" { source = "./config" }

module "latest" {
  source             = "../../tflib/publisher"
  name               = basename(path.module)
  target_repository  = var.target_repository
  config             = module.latest-config.config
  extra_dev_packages = local.fluentd_dev
}

module "latest-splunk" {
  source             = "../../tflib/publisher"
  name               = basename(path.module)
  target_repository  = var.target_repository
  config             = module.latest-config.config
  extra_packages     = local.splunk
  extra_dev_packages = local.fluentd_dev
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
}

module "test-splunk" {
  source = "./tests/splunk"
  digest = module.latest-splunk.image_ref
}

resource "oci_tag" "latest" {
  depends_on = [module.test-latest]
  digest_ref = module.latest.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test-latest]
  digest_ref = module.latest.dev_ref
  tag        = "latest-dev"
}

resource "oci_tag" "latest-splunk" {
  depends_on = [module.test-splunk]
  digest_ref = module.latest-splunk.image_ref
  tag        = "latest-splunk"
}

resource "oci_tag" "latest-splunk-dev" {
  depends_on = [module.test-splunk]
  digest_ref = module.latest-splunk.dev_ref
  tag        = "latest-splunk-dev"
}
