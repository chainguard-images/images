terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  java_version = "25"
}

module "config" {
  source         = "./config"
  extra_packages = ["maven", "openjdk-${local.java_version}-default-jdk", "busybox", "glibc-locale-en"]
}

module "maven" {
  source             = "../../tflib/publisher"
  name               = basename(path.module)
  target_repository  = var.target_repository
  config             = module.config.config
  build-dev          = true
  extra_dev_packages = ["openjdk-${local.java_version}-jmods", "binutils"]
}

module "test" {
  source = "./tests"
  digest = module.maven.image_ref
}

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [module.test]

  tags = {
    "latest" : module.maven.image_ref
    "latest-dev" : module.maven.dev_ref
  }
}
