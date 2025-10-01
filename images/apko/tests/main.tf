terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    apko = string
  })
}

variable "target_repository" {
  description = "The target repository for test images."
}

module "bash_sandbox" {
  source            = "../../../tflib/imagetest/sandboxes/bash"
  target_repository = var.target_repository
}

module "dind_test" {
  source = "../../../tflib/imagetest/tests/docker-in-docker"
  images = { apko = var.digests.apko }
  tests = [{
    name    = "apko-version"
    image   = module.bash_sandbox.image_ref
    content = [{ source = path.module }]
    cmd     = "./test.sh"
  }]
}