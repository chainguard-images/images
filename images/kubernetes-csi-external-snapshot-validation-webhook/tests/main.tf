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

resource "imagetest_harness_k3s" "this" {
  name      = "kubernetes-csi-external-snapshot-validation-webhook"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
    envs = {
      "IMAGE_NAME" = var.digest
      "VERSION"    = "v6.2.2"
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Basic installation"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name  = "test"
      cmd   = "/tests/deploy.sh"
      retry = { delay = "10s", attempts = 5 }
    },
  ]

  labels = {
    type = "k8s",
  }
}
