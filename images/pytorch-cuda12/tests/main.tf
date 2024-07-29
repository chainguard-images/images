terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "this" {
}

resource "imagetest_harness_docker" "this" {
  inventory = data.imagetest_inventory.this
  name      = "pytorch"
}

resource "imagetest_feature" "basic" {
  description = "Placeholder"
  harness     = imagetest_harness_docker.this
  labels = {
    type = "container"
    # Group this image into a pytorch only shard
    "shard::group" = "pytorch"
  }
  name = "Placeholder"
  steps = [
    {
      name = "Placeholder"
      cmd  = "exit 0"
    },
  ]
}

