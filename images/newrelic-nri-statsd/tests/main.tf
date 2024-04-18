terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digests to run tests over."
}

variable "license_key" {}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_docker" "this" {
  name      = "newrelic-nri-statsd"
  inventory = data.imagetest_inventory.this

  mounts = [
    {
      source      = path.module
      destination = "/tests"
    }
  ]

  envs = {
    NR_API_KEY = var.license_key
    IMAGE_NAME = var.digest
  }
}

resource "imagetest_feature" "basic" {
  name    = "basic test"
  harness = imagetest_harness_docker.this

  steps = [
    {
      name = "Version check"
      cmd  = "/tests/smoke.sh"
    },
  ]

  timeouts = {
    create = "3m"
  }
}
