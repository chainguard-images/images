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
  name      = "bank-vaults"
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

  name  = "vault-operator"
  chart = "oci://ghcr.io/bank-vaults/helm-charts/vault-operator"

  values = {
    bankVaults = {
      image = {
        repository = local.parsed.registry_repo
        tag        = local.parsed.pseudo_tag
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Basic Helm install for bank-vaults"
  harness     = imagetest_harness_k3s.this

  steps = [
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
