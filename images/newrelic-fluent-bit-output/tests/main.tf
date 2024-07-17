terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "license_key" {}

variable "target_repository" {}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

module "cluster_harness" {
  source = "../../../tflib/imagetest/harnesses/k3s/"

  inventory         = data.imagetest_inventory.this
  name              = basename(path.module)
  target_repository = var.target_repository
  cwd               = path.module
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  repo  = "https://helm-charts.newrelic.com"
  chart = "nri-bundle"

  values = {
    global = {
      cluster    = "test"
      licenseKey = var.license_key
    }

    newrelic-logging = {
      enabled = true
      image = {
        # `registry` doesn't exist here, it isn't consistent with the rest of the subcharts
        repository = local.parsed.registry_repo
        tag        = local.parsed.pseudo_tag
      }
    }

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
  name        = "basic"
  description = "Basic installation"
  harness     = module.cluster_harness.harness

  steps = [
    {
      name = "Helm Install"
      cmd  = module.helm.install_cmd
    }
  ]

  labels = {
    type = "k8s"
  }
}