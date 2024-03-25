terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

data "oci_string" "ref" { input = var.digest }

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "help" {
  digest = var.digest
  script = "${path.module}/smoke-test.sh"
}

variable "chart_version" {
  description = "The version of the chart to test."
  default     = "latest"
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "prometheus-blackbox-exporter"
  inventory = data.imagetest_inventory.this
}

resource "random_pet" "suffix" {}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name          = "prometheus-blackbox-exporter-${random_pet.suffix.id}"
  namespace     = "prometheus-blackbox-exporter-${random_pet.suffix.id}"
  repo          = "https://prometheus-community.github.io/helm-charts"
  chart         = "prometheus-blackbox-exporter"
  chart_version = var.chart_version

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
  description = "Test a basic installation of the prometheus-blackbox-exporter with Helm chart."
  harness     = imagetest_harness_k3s.this

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    }
  ]

  labels = {
    type = "k8s",
  }
}



