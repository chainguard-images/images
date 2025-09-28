terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "target_repository" {
  description = "The target repository for the sandbox image."
}

module "bash_sandbox" {
  source            = "../../../tflib/imagetest/sandboxes/bash"
  target_repository = var.target_repository
}

module "docker_test" {
  source = "../../../tflib/imagetest/tests/docker-in-docker"

  images = { "melange" = var.digest }

  tests = [
    {
      name    = "melange build test"
      image   = module.bash_sandbox.image_ref
      content = [{ source = path.module }]
      cmd     = "./test.sh"
    }
  ]
}
