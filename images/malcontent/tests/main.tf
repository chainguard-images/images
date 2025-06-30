terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

variable "image_version" {
  description = "String used in the test harness name to help identify what version is being tested."
}

locals {
  parsed = provider::oci::parse(var.digest)
}

module "bash_sandbox" {
  source            = "../../../tflib/imagetest/sandboxes/bash/"
  target_repository = var.target_repository
}

module "dind_test" {
  cwd    = path.module
  images = { malcontent = var.digest }
  name   = var.image_version
  source = "../../../tflib/imagetest/tests/docker-in-docker"
  tests = [
    {
      name  = "basic functionality"
      image = module.bash_sandbox.image_ref
      cmd   = "./docker-test.sh"
    }
  ]
}

