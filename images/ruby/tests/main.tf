terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "target_repository" {
  description = "The target repository for the test harness"
}

variable "name" {
  description = "The name to use for the test harness"
  default     = "ruby-test"
}

module "bash_sandbox" {
  source            = "../../../tflib/imagetest/sandboxes/bash"
  target_repository = var.target_repository
}

module "docker_test" {
  source = "../../../tflib/imagetest/tests/docker-in-docker"
  name   = var.name

  images = {
    ruby = var.digest
  }

  tests = [
    {
      name    = "comprehensive"
      image   = module.bash_sandbox.image_ref
      content = [{ source = path.module }]
      cmd     = "./comprehensive-tests.sh"
    }
  ]
}