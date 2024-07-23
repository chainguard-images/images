terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_docker" "docker" {
  name      = "docker"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_feature" "image" {
  name        = "image"
  description = "Basic image test"
  harness     = imagetest_harness_docker.docker

  steps = [
    {
      name = "kubectl help"
      cmd  = "docker run --rm ${var.digest} help"
    },
  ]

  labels = {
    type = "container"
  }
}
