terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

resource "random_id" "suffix" {
  byte_length = 4
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "cassandra-medusa"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
    envs = {
      "NAMESPACE"              = "k8s-medusa-${random_id.suffix.hex}"
      "IMAGE_REGISTRY"         = local.parsed.registry
      "IMAGE_REPOSITORY"       = local.parsed.repo
      "NAME"                   = "cassandra-medusa"
      "K8SSANDRA_CLUSTER_NAME" = "foo-${random_id.suffix.hex}"
      "IMAGE_TAG"              = local.parsed.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the cert-manager helm chart."

  steps = [
    {
      name = "Test"
      cmd  = "/tests/medusa-install.sh"
    },
  ]

  labels = {
    type = "k8s"
  }

  timeouts = {
    create = "15m"
  }
}
