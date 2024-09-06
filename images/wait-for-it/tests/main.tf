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

resource "imagetest_harness_docker" "this" {
  name      = "wait-for-it"
  inventory = data.imagetest_inventory.this

  envs = {
    "IMAGE_NAME" : var.digest
  }
}

resource "imagetest_feature" "docker" {
  name    = "Test waiting for it"
  harness = imagetest_harness_docker.this

  steps = [
    {
      name = "wait for google"
      cmd  = <<EOF
        set -o errexit -o nounset -o errtrace -o pipefail -x -x
        docker run --rm $IMAGE_NAME -h google.com -p 80
      EOF
  }]
}
