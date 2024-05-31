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

resource "random_integer" "port" {
  min = 9100
  max = 60000
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "k3s" {
  name      = "prometheus-node-exporter"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "prometheus-node-bitnami"
  chart     = "oci://registry-1.docker.io/bitnamicharts/node-exporter"
  namespace = "prometheus-node-bitnami"

  values = {
    service = {
      ports = {
        metrics = random_integer.port.result
      }
    }
    image = {
      registry   = local.parsed.registry
      repository = local.parsed.repo
      digest     = local.parsed.digest
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation test for prometheus-node-bitnami helm chart"
  harness     = imagetest_harness_k3s.k3s

  steps = [
    {
      name = "Install prometheus-node-bitnami"
      cmd  = module.helm.install_cmd
    },
  ]

  labels = {
    type = "k8s"
  }
}
