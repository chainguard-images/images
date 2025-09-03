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
    "gradle",
    "openjdk-24-default-jdk",
    "busybox",
    "glibc-locale-en"
  ]
}

module "latest" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository  = var.target_repository
  config             = module.config.config
  extra_dev_packages = ["binutils"]
}

module "test-latest" {
  source            = "./tests"
  digest            = module.latest.image_ref
  java-version      = "24"
  target_repository = var.target_repository
}

module "tagger" {
  depends_on = [module.test-latest]
  source     = "../../tflib/tagger"
  tags = {
    "latest" = module.latest.image_ref
  }
}
