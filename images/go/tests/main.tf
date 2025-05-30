terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "target_repository" {
}

variable "image_version" {
}

module "bash_sandbox" {
  source            = "../../../tflib/imagetest/sandboxes/bash"
  target_repository = var.target_repository
}

module "dind_test" {
  images = { go = var.digest }
  name   = var.image_version
  source = "../../../tflib/imagetest/tests/docker-in-docker"
  tests = [
    {
      name    = "smoke"
      image   = module.bash_sandbox.image_ref
      content = [{ source = path.module }]
      cmd     = "./smoke.sh"
    }
  ]
}

