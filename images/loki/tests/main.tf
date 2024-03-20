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
  name      = "loki"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  namespace = "loki-system"
  chart     = "loki"
  repo      = "https://grafana.github.io/helm-charts"

  values = {
    loki = {
      commonConfig = {
        replication_factor = 1
      }
      image = {
        registry   = data.oci_string.ref.registry
        repository = data.oci_string.ref.repo
        tag        = data.oci_string.ref.pseudo_tag
      }
      storage = {
        type = "filesystem"
      }
    }
    backend = {
      persistence = {
        size = "1Gi"
      }
    }
    singleBinary = {
      replicas = 1
      persistence = {
        size = "1Gi"
      }
      registry   = data.oci_string.ref.registry
      repository = data.oci_string.ref.repo
      tag        = data.oci_string.ref.pseudo_tag
    }
    write = {
      persistence = {
        size = "1Gi"
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the loki helm chart."

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
