terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digest to run tests over."
  type = object({
    dashboard       = string
    metrics-scraper = string
  })
}

variable "name" {
  default = "kubernetes-dashboard"
}

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = var.name
  inventory = data.imagetest_inventory.this
}

module "install" {
  source = "../../../tflib/imagetest/helm"

  repo          = "https://kubernetes.github.io/dashboard/"
  chart         = "kubernetes-dashboard"
  chart_version = "6.0.8"

  values = {
    image = {
      tag        = local.parsed["dashboard"].pseudo_tag
      repository = local.parsed["dashboard"].registry_repo
    }
    metricsScraper = {
      image = {
        tag        = local.parsed["metrics-scraper"].pseudo_tag
        repository = local.parsed["metrics-scraper"].registry_repo
      }
      enabled = true
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
