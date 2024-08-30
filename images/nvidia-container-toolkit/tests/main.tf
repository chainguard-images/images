terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_pterraform" "gpu" {
  inventory = data.imagetest_inventory.this
  name      = basename(path.module)

  path = "${path.root}/tflib/imagetest/harnesses/pterraform/gpu/"

  vars = jsonencode({
    image_ref = var.digest
    mounts = [
      { source = "/var/run/docker.sock", destination = "/var/run/docker.sock" },
    ]
    envs = [
      "ROOT=/work",
    ]
    project = "img-test-infra-f2ea"
    region  = "us-central1"
    zone    = "us-central1-c"
  })

  timeouts = {
    # Set to longer than the default 5m timeout, GPUs take a while to provision
    # and attach
    create = "10m"
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic test for nvidia-container-toolkit"
  harness     = imagetest_harness_pterraform.gpu

  steps = [
    {
      name = "Run the toolkit"
      cmd  = "/work/nvidia-toolkit"
    }
  ]

  labels = {
    type     = "container"
    requires = "gpu"
    cloud    = "gcp"

    # Group this image alongside other GPU enabled images, mostly for
    # consolidating test times, each harness will still have its own GPU
    "shard::group" = "gpu"
  }

  timeouts = {
    create = "10m"
  }
}
