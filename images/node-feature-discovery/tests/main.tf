terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    helm      = { source = "hashicorp/helm" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "node-feature-discovery"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }
}

module "helm_node-feature-discovery" {
  source = "../../../tflib/imagetest/helm"
  chart  = "node-feature-discovery"
  repo   = "https://kubernetes-sigs.github.io/node-feature-discovery/charts"
  name   = "node-feature-discovery"
  values = {
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
      pullPolicy = "Always"
    }
  }
}

resource "imagetest_feature" "test_labels" {
  harness     = imagetest_harness_k3s.this
  name        = "Test Labels"
  description = "Basic functionality of the node-feature-discovery helm chart."

  steps = [
    {
      name = "Helm install node-feature-discovery"
      cmd  = module.helm_node-feature-discovery.install_cmd
    },
    {
      name = "Ensure it has the necessary labels For CPU, Kernel and Storage"
      cmd  = <<EOF
apk add jq bash
bash /tests/test-labels.sh
      EOF
    }
  ]

  labels = {
    type = "k8s"
  }
}