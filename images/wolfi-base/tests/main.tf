terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "target_repository" {}

module "bash_sandbox" {
  source            = "../../../../tflib/imagetest/sandboxes/bash"
  target_repository = var.target_repository
}

module "dind_test" {
  source = "../../../../tflib/imagetest/tests/docker-in-docker"

  images = { "chainguard-base" = var.digest }

  tests = [
    {
      name    = "wolfi-base-tests"
      image   = module.bash_sandbox.image_ref
      content = [{ source = path.module }]
      cmd     = "./test.sh"
    }
  ]
}
