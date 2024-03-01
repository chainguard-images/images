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
  name      = "node-local-dns"
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

module "helm" {
  source = "../../../tflib/imagetest/helm"
  chart  = "node-local-dns"
  repo   = "https://charts.deliveryhero.io/"
  name   = "node-local-dns"
  values = {
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
    config = {
      localDns = "0.0.0.0"
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the image."

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
  ]

  labels = {
    type = "k8s"
  }
}
