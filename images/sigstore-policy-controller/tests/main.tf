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

resource "imagetest_harness_k3s" "k3s" {
  name      = "k3s"
  inventory = data.imagetest_inventory.this
  sandbox = {
    envs = {
      "TEST_NAMESPACE" : "pc-test"
    }

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

  name      = "pc"
  repo      = "https://sigstore.github.io/helm-charts"
  chart     = "policy-controller"
  namespace = "pc"

  values = {
    webhook = {
      image = {
        repository = local.parsed.registry_repo
        version    = local.parsed.digest
      }
    }
  }
}

resource "imagetest_feature" "e2e" {
  name        = "e2e"
  description = "e2e testing with the Helm chart"
  harness     = imagetest_harness_k3s.k3s

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name    = "Upstream e2e tests"
      workdir = "/tests"
      cmd     = "./e2e_test.sh"
    }
  ]
}
