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
  name      = "kube-webhook-certgen"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "prometheus-operator"
  namespace = "monitoring"
  repo      = "https://prometheus-community.github.io/helm-charts"
  chart     = "kube-prometheus-stack"

  values = {
    prometheusOperator = {
      admissionWebhooks = {
        patch = {
          image = {
            registry   = local.parsed.registry
            repository = local.parsed.repo
            tag        = local.parsed.pseudo_tag
          }
        }
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the kube-monitoring stack Helm chart."

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
