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

data "oci_exec_test" "cloudwatch-runs" {
  digest      = var.digest
  script      = "./cloudwatch-runs.sh"
  working_dir = path.module
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "k3s" {
  name      = "cloudwatch-exporter"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "prometheus-cloudwatch-exporter"
  repo      = "https://prometheus-community.github.io/helm-charts"
  chart     = "prometheus-cloudwatch-exporter"
  namespace = "prometheus-cloudwatch-exporter"

  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation test for prometheus-cloudwatch-exporter helm chart"
  harness     = imagetest_harness_k3s.k3s

  steps = [
    {
      name = "Install prometheus-cloudwatch-exporter"
      cmd  = module.helm.install_cmd
    },
  ]

  labels = {
    type = "k8s"
  }
}
