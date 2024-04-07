terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The digest of the image"
}

data "oci_string" "ref" { input = var.digest }

variable "target_repository" {
  description = "The docker repo name"
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "step-ca"
  inventory = data.imagetest_inventory.this

  sandbox = {
    envs = {
      "IMAGE_REGISTRY"   = data.oci_string.ref.registry
      "IMAGE_REPOSITORY" = data.oci_string.ref.repo
      "IMAGE_TAG"        = data.oci_string.ref.pseudo_tag
    }
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }
}

resource "imagetest_feature" "helm-install" {
  name    = "step-ca"
  harness = imagetest_harness_k3s.this

  description = "Testing step-ca helm deployment in k3s cluster."

  steps = [
    {
      name = "Test the image deployment"
      cmd  = "/tests/k8s-test.sh"
    }
  ]

  timeouts = {
    # Bump the default, cassandra is stupid big.
    create = "3m"
  }
}
