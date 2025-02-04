terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  source = "./config"
  extra_packages = [
    "gradle-8",
    "openjdk-23-default-jdk",
    "busybox",
    "glibc-locale-en"
  ]
}

module "latest" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository  = var.target_repository
  config             = module.config.config
  extra_dev_packages = ["openjdk-23-jmods", "binutils"]
}

module "test-latest" {
  source            = "./tests"
  digest            = module.latest.image_ref
  java-version      = "23"
  target_repository = var.target_repository
}

resource "oci_tag" "latest" {
  depends_on = [module.test-latest]
  digest_ref = module.latest.image_ref
  tag        = "latest"
}
