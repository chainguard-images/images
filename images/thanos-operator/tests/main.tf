terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "name" {
  default = "thanos-operator"
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = var.name
  inventory = data.imagetest_inventory.this
}

module "install" {
  source = "../../../tflib/imagetest/helm"

  repo  = "https://kubernetes-charts.banzaicloud.com"
  chart = "thanos-operator"

  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of ${var.name}."

  steps = [
    {
      name = "Helm install"
      cmd  = module.install.install_cmd
    },
  ]

  labels = {
    type = "k8s"
  }
}
