terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "grafana-rollout-operator"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [{
      source      = path.module
      destination = "/tests"
    }]
  }
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name          = "grafana-rollout-operator"
  namespace     = "grafana-rollout-operator"
  repo          = "https://grafana.github.io/helm-charts"
  chart         = "rollout-operator"
  chart_version = "0.15.0"

  values = {
    image = {
      tag        = data.oci_string.ref.pseudo_tag
      repository = data.oci_string.ref.registry_repo
    }
  }
}


resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of Grafana Operator."

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Grafana rollout operator test pods"
      cmd  = <<EOF
      kubectl wait pod -n grafana-rollout-operator --all --for=condition=Ready
    EOF
    },
    {
      name = "Check logs for grafana-rollout-operator"
      cmd  = "./tests/logs.sh"
    }
  ]

  labels = {
    type = "k8s"
  }
}
