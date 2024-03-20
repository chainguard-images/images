terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
    random    = { source = "hashicorp/random" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

resource "random_id" "id" { byte_length = 4 }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "crossplane-aws"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
    envs = {
      "RELEASE_ID"        = random_id.id.hex
      "RELEASE_NAME"      = "doppler-kubernetes-operator-${random_id.id.hex}"
      "RELEASE_NAMESPACE" = "doppler-kubernetes-operator"
    }
  }
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "doppler-kubernetes-operator-${random_id.id.hex}"
  namespace = "doppler-kubernetes-operator"
  repo      = "https://helm.doppler.com"
  chart     = "doppler-kubernetes-operator"

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
  description = "Basic dask-gateway Helm install test"
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
  ]

  labels = {
    type = "k8s",
  }
}
