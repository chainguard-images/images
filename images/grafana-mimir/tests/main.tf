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
  name      = "mlflow"
  inventory = data.imagetest_inventory.this

  sandbox = {
    envs = {
      "NAME" : "mimir"
      "NAMESPACE" : "mimir"
    }
    mounts = [{
      source      = path.module
      destination = "/tests"
    }]
  }
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "mimir"
  namespace = "mimir"
  repo      = "https://grafana.github.io/helm-charts"
  chart     = "mimir-distributed"
  timeout   = "15m"

  values = {
    image = {
      repository = data.oci_string.ref.registry_repo
      tag        = data.oci_string.ref.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the Grafana Mimir Helm chart."

  steps = [{
    name = "Install Helm chart"
    cmd  = module.helm.install_cmd
    }, {
    name    = "Test Mimir"
    workdir = "/tests"
    cmd     = <<EOF
      ./check-mimir.sh
    EOF
  }]

  labels = {
    type = "k8s"
  }

  timeouts = {
    // Set an upper limit for all other ops.
    create = "15m"
  }
}
