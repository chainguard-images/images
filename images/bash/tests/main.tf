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
  name      = "bash"
  inventory = data.imagetest_inventory.this

  envs = {
    "IMAGE_NAME" : var.digest
  }
}

resource "imagetest_feature" "docker" {
  name    = "Test bash"
  harness = imagetest_harness_docker.this

  steps = [
    {
      name = "run a bash function"
      cmd  = <<EOF
        docker run --rm $IMAGE_NAME \
          "function hello() { echo 'hello world'; }; hello" |grep "hello world"
      EOF
  }]
}
