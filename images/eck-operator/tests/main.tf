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
  name      = "eck-operator"
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

  name = "eck-operator"

  repo  = "https://helm.elastic.co"
  chart = "eck-operator"

  values = {
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Basic Helm install for bank-vaults"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Add Elastic Helm repo"
      cmd  = <<EOm
        apk add --no-cache curl jq nmap
      EOm
    },
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name    = "Run full test"
      workdir = "/tests"
      cmd     = <<EOm
        ./full-test.sh
      EOm
    }
  ]
}
