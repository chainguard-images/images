terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "inventory" {}

resource "imagetest_harness_docker" "docker" {
  name      = "docker"
  inventory = data.imagetest_inventory.inventory

  envs = {
    IMAGE_NAME : var.digest
  }
}

resource "imagetest_feature" "test" {
  name    = "docker-test"
  harness = imagetest_harness_docker.docker

  steps = [
    {
      name = "basic test"
      cmd  = "docker run --rm $IMAGE_NAME --info"
    }
  ]
}
