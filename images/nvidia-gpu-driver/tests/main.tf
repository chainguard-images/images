terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "inventory" {}

# It is more like a toolbox of gpu-driver so we are just going with basic docker tests of tools for now.

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

  steps = [{
    name = "vgpu-util test"
    cmd  = "docker run --rm --entrypoint vgpu-util $IMAGE_NAME --version"

    name = "nvidia-fabricmanager test"
    cmd  = "docker run --rm --entrypoint nv-fabricmanager $IMAGE_NAME -v"

  }]
}