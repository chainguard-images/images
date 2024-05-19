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

resource "imagetest_harness_docker" "docker" {
  name      = "nifi-docker"
  inventory = data.imagetest_inventory.this

  mounts = [{
    source      = path.module
    destination = "/tests"
  }]

  envs = {
    IMAGE_NAME : var.digest
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic test for Apache NiFi"
  harness     = imagetest_harness_docker.docker

  steps = [{
    name = "Ensure images are present in the daemon"
    cmd  = <<EOF
      docker pull "$IMAGE_NAME"
      docker pull cgr.dev/chainguard/curl
    EOF
    }, {
    name = "Test NiFi"
    cmd  = "/tests/check-nifi.sh"
  }]

  labels = {
    type = "container"
  }
}
