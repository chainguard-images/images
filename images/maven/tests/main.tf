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

locals {
  parsed = provider::oci::parse(var.digest)
}

module "bash_sandbox" {
  source            = "../../../tflib/imagetest/sandboxes/bash/"
  target_repository = var.target_repository
}

module "dind_test" {
  source = "../../../tflib/imagetest/tests/docker-in-docker"

  images = { maven = var.digest }
  cwd    = path.module

  tests = [
    {
      name  = "maven-test"
      image = module.bash_sandbox.image_ref
      cmd   = "./test.sh"
    }
  ]
}
