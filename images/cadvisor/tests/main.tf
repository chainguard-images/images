terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

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
      "IMAGE_REGISTRY"   = data.oci_string.ref.registry
      "IMAGE_REPOSITORY" = data.oci_string.ref.repo
      "IMAGE_TAG"        = data.oci_string.ref.pseudo_tag
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
