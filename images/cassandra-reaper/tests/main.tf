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

resource "random_pet" "suffix" {}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "cassandra-reaper"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
    envs = {
      "IMAGE_REGISTRY"   = local.parsed.registry
      "IMAGE_REPOSITORY" = split("/", local.parsed.repo)[0]
      "IMAGE_TAG"        = local.parsed.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of cassandra-reaper."

  steps = [
    {
      name = "Test"
      cmd  = "/tests/smoke-test.sh"
    },
  ]

  labels = {
    type = "k8s"
  }

  timeouts = {
    # Bump the default, cassandra is stupid big.
    create = "15m"
  }
}
