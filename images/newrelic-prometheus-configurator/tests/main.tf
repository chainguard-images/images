terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "license_key" {}

variable "digest" {
  description = "The image digests to run tests over."
  type        = string
}

data "oci_string" "ref" {
  input = var.digest
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "newrelic-prometheus-agent"
  inventory = data.imagetest_inventory.this
}

module "nri_bundle_install" {
  source = "../../../tflib/imagetest/helm"

  namespace = "newrelic-pc"
  repo      = "https://helm-charts.newrelic.com"
  chart     = "nri-bundle"

  values = {
    global = {
      cluster    = "test"
      licenseKey = var.license_key
    }

    newrelic-prometheus-agent = {
      enabled = true
      images = {
        configurator = {
          registry   = data.oci_string.ref.registry
          repository = data.oci_string.ref.repo
          tag        = data.oci_string.ref.pseudo_tag
        }
        prometheus = {
          registry   = "cgr.dev"
          repository = "chainguard/prometheus"
          tag        = "latest"
        }
      }
    }

    nri-prometheus               = { enabled = false }
    newrelic-infrastructure      = { enabled = false }
    nri-metadata-injection       = { enabled = false }
    kube-state-metrics           = { enabled = false }
    newrelic-pixie               = { enabled = false }
    pixie-chart                  = { enabled = false }
    newrelic-infra-operator      = { enabled = false }
    newrelic-k8s-metrics-adapter = { enabled = false }

  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the nri bundle helm chart."

  steps = [
    {
      name = "Helm install"
      cmd  = module.nri_bundle_install.install_cmd
    },
  ]

  labels = {
    type = "k8s"
  }
}
