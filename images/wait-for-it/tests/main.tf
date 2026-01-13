terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "bash_sandbox" {
  source            = "../../../tflib/imagetest/sandboxes/bash/"
  target_repository = var.target_repository
}

module "dind_test" {
  source = "../../../tflib/imagetest/tests/docker-in-docker"

  images = {
    "wait-for-it" = var.digest
  }

  cwd = path.module

  tests = [
    {
      name  = "wait-for-it functionality"
      image = module.bash_sandbox.image_ref
      cmd   = "./docker-test.sh"
    }
  ]
}
