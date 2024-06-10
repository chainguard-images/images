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
  name      = "tempo-fips"
  inventory = data.imagetest_inventory.this
  envs = {
    "IMAGE_NAME" : var.digest
    "CONTAINER_NAME" : "percona-test"
  }
  mounts = [
    {
      source      = path.module
      destination = "/tests"
    }
  ]
}


resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_docker.this
  name        = "Basic"
  description = "Basic percona test - run the mysql command."

  steps = [
    {
      name = "Run mysql command"
      cmd  = "/tests/02-runs.sh"
    }
  ]
}

