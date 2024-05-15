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

resource "imagetest_harness_k3s" "this" {
  name      = "cadvisor"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
    envs = {
      "NAMESPACE"        = "cadvisor"
      "IMAGE_REGISTRY"   = local.parsed.registry
      "IMAGE_REPOSITORY" = local.parsed.repo
      "IMAGE_TAG"        = local.parsed.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of cadvisor."

  steps = [
    {
      name = "Test"
      cmd  = "/tests/runs.sh"
    },
    {
      name  = "Check"
      cmd   = <<EOF
kubectl wait --for=condition=ready pod --selector app=cadvisor --namespace $NAMESPACE
      EOF
      retry = { attempts = 10, delay = "5s" }
    },
  ]

  labels = {
    type = "k8s"
  }
}
