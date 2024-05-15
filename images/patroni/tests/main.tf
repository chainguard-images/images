terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "name" {
  default = "patroni"
}

data "oci_string" "ref" { input = var.digest }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_docker" "this" {
  name      = "patroni"
  inventory = data.imagetest_inventory.this

  envs = {
    IMAGE_NAME = var.digest
  }
}

resource "imagetest_feature" "basic" {
  name    = "basic test"
  harness = imagetest_harness_docker.this

  steps = [
    {
      name = "Version check"
      cmd  = "docker run --rm $IMAGE_NAME version"
    }
  ]
}