terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_docker" "this" {
  name      = "rstudio"
  inventory = data.imagetest_inventory.this
  envs = {
    "IMAGE_NAME" : var.digest
  }
  mounts = [{
    source      = path.module
    destination = "/tests"
  }]
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_docker.this
  name        = "Basic"
  description = "Basic RStudio test."

  steps = [{
    name = "Test RStudio",
    cmd  = "/tests/smoke.sh"
  }]
}
