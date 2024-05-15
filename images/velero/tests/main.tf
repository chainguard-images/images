terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digests to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "velero"
  inventory = data.imagetest_inventory.this

  sandbox = {
    envs = {
      "IMAGE_REGISTRY"   = local.parsed.registry
      "IMAGE_REPOSITORY" = local.parsed.repo
      "IMAGE_TAG"        = local.parsed.pseudo_tag
    }
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the velero helm chart."

  steps = [
    {
      name = "Basic smoke test that providers install"
      cmd  = "/tests/docker-test.sh"
    },
  ]

  labels = {
    type = "k8s"
  }

  timeouts = {
    # This can take a while since we're working in serial to avoid disk
    # pressure
    create = "15m"
  }
}
