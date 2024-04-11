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
  name      = "step-issuer"
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
  name      = "step-issuer"
  namespace = "step-issuer"
  repo      = "https://smallstep.github.io/helm-charts"
  chart     = "step-issuer"
}

resource "imagetest_feature" "helm-install" {
  name        = "step-issuer"
  harness     = imagetest_harness_k3s.this
  description = "Testing step-issuer helm deployment in k3s cluster."

  steps = [
    {
      name = "Install the helm chart"
      cmd  = module.helm.install_cmd
    }
  ]
}
