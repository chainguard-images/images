terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    helm      = { source = "hashicorp/helm" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "prometheus-config-reloader"
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
  source    = "../../../tflib/imagetest/helm"
  repo      = "https://prometheus-community.github.io/helm-charts"
  chart     = "kube-prometheus-stack"
  name      = "prometheus-config-reloader"
  namespace = "prometheus-operator"
  values = {
    prometheusOperator = {
      prometheusConfigReloader = {
        image = {
          registry   = local.parsed.registry
          repository = local.parsed.repo
          tag        = local.parsed.pseudo_tag
        }
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the image."

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Test"
      cmd  = "/tests/smoke-test.sh"
    }
  ]

  labels = {
    type = "k8s"
  }
}
