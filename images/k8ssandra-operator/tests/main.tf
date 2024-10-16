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
  default = "k8ssandra-operator"
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = var.name
  inventory = data.imagetest_inventory.this
}

module "helm_cert_manager" {
  source = "../../../tflib/imagetest/helm"
  name   = "cert-manager"
  repo   = "https://charts.jetstack.io"
  chart  = "cert-manager"

  values = {
    installCRDs = true
  }
}

module "helm_k8ssandra" {
  source = "../../../tflib/imagetest/helm"
  name   = "k8ssandra"
  repo   = "https://helm.k8ssandra.io/stable"
  chart  = "k8ssandra-operator"

  values = {
    image = {
      registry   = local.parsed.registry
      repository = local.parsed.repo
      tag        = local.parsed.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the image."

  steps = [
    {
      name = "Helm install cert-manager"
      cmd  = module.helm_cert_manager.install_cmd
    },
    {
      name = "Helm install k8ssandra"
      cmd  = module.helm_k8ssandra.install_cmd
    },
  ]

  labels = {
    type = "k8s"
  }
}

