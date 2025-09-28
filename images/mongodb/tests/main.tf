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
  description = "The target repository for the sandbox image."
}

variable "mongo_version" {
  description = "The MongoDB version identifier for unique test naming."
  default     = "latest"
}

variable "fips_enabled" {
  description = "Indicates whether this is a FIPS image or not."
  default     = 0
}

locals {
  parsed = provider::oci::parse(var.digest)
}

module "bash_sandbox" {
  source            = "../../../tflib/imagetest/sandboxes/bash/"
  target_repository = var.target_repository
}

module "docker_test" {
  source = "../../../tflib/imagetest/tests/docker-in-docker"
  name   = "mongodb-${var.mongo_version}"

  images = { "mongodb" = var.digest }

  tests = [
    {
      name    = "mongodb functionality test"
      image   = module.bash_sandbox.image_ref
      content = [{ source = path.module }]
      cmd     = "./test-mongodb.sh"
      envs = {
        IMAGE_REF    = var.digest
        FIPS_ENABLED = var.fips_enabled
      }
    }
  ]
}
