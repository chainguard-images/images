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

// Run a simple Docker test to verify the image is working.
resource "imagetest_harness_docker" "docker" {
  name      = "docker"
  inventory = data.imagetest_inventory.inventory

  envs = {
    IMAGE_NAME : var.digest
  }
  mounts = [
    {
      source      = path.module
      destination = "/tests"
    }
  ]
}

resource "imagetest_feature" "test" {
  name    = "docker-test"
  harness = imagetest_harness_docker.docker

  steps = [{
    name    = "basic test"
    workdir = "/tests"
    cmd     = <<EOF
        /tests/smoke.sh
      EOF
    },
  ]
}
