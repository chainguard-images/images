terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_docker" "this" {
  name      = "nats"
  inventory = data.imagetest_inventory.this

  mounts = [
    {
      source      = path.module
      destination = "/tests"
    }
  ]

  envs = {
    IMAGE_NAME = var.digest
  }
}

resource "imagetest_feature" "basic" {
  name    = "basic test"
  harness = imagetest_harness_docker.this

  steps = [
    {
      name    = "healthy"
      workdir = "/tests"
      cmd     = "./healthy.sh"
    },
  ]
}
