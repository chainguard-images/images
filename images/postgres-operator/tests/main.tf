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

resource "random_pet" "suffix" {}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "postgres-operator"
  inventory = data.imagetest_inventory.this

  sandbox = {

    envs = {
      "NAMESPACE" : "postgres-operator"
      "NAME" : "postgres-operator-${random_pet.suffix.id}"
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

  name      = "postgres-operator-${random_pet.suffix.id}"
  namespace = "postgres-operator"
  repo      = "https://opensource.zalando.com/postgres-operator/charts/postgres-operator"
  chart     = "postgres-operator"
  values = {
    image = {
      registry   = data.oci_string.ref.registry
      repository = data.oci_string.ref.repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  }
}


resource "imagetest_feature" "basic" {
  name        = "Basic"
  description = "Basic Helm install for postgres-operator"
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
        ./smoke-test.sh
      EOm
    }
  ]
}