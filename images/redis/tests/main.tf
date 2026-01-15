terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

# this test is skipped for v6.x defined in the request-2234 image
variable "test_activedefrag" {
  default = true
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "bash_sandbox" {
  source            = "../../../tflib/imagetest/sandboxes/bash/"
  target_repository = var.target_repository
}

module "basic-dind-test" {
  source = "../../../tflib/imagetest/tests/docker-in-docker"

  images = { redis = var.digest }
  cwd    = path.module

  tests = [
    {
      name  = "basic functionality"
      image = module.bash_sandbox.image_ref
      cmd   = "./01-docker-test.sh"
    }
  ]
}


module "server-activedefrag-dind-test" {
  count  = var.test_activedefrag ? 1 : 0
  source = "../../../tflib/imagetest/tests/docker-in-docker"

  images = { redis = var.digest }
  cwd    = path.module

  tests = [
    {
      name  = "basic functionality"
      image = module.bash_sandbox.image_ref
      cmd   = "./02-server-activedefrag.sh"
    }
  ]
}
