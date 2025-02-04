terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "check-dev" {
  default     = false
  description = "Whether to check for dev extensions"
}

variable "target_repository" {
}

module "bash_sandbox" {
  source            = "../../../tflib/imagetest/sandboxes/bash"
  target_repository = var.target_repository
}

module "dind_test" {
  images = { rust = var.digest }
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

