terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "inventory" {
}

resource "imagetest_harness_docker" "docker" {
  envs = {
    IMAGE_NAME : var.digest
  }
  inventory = data.imagetest_inventory.inventory
  name      = "docker"
}

resource "imagetest_feature" "test" {
  harness = imagetest_harness_docker.docker
  name    = "docker-test"
  steps = [
    {
      name = "basic test"
      cmd  = "docker run --rm $IMAGE_NAME --info"
    }
  ]
}

