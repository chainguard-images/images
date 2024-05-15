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

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME version"
}

data "oci_string" "ref" { input = var.digest }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_docker" "this" {
  name      = "step-cli"
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