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

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "k3s" {
  name      = "newrelic-prometheus"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "newrelic-prometheus"
  repo      = "https://helm-charts.newrelic.com"
  chart     = "nri-bundle"
  namespace = "newrelic-prometheus"

  values = {
    global = {
      cluster    = "test"
      licenseKey = var.license_key
    }

    nri-prometheus = {
      enabled = true
      image = {
        registry   = local.parsed.registry
        repository = local.parsed.repo
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
  description = "Basic installation test for newrelic helm chart"
  harness     = imagetest_harness_k3s.k3s

  steps = [
    {
      name = "Install newrelic"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Check deployment"
      cmd  = <<EOF
apk add curl
kubectl port-forward -n "newrelic-prometheus" "deployment.apps/${module.helm.release_name}-nri-prometheus" "8080:8080" &
sleep 5
curl "localhost:8080/metrics" | grep 'nr_stats'
      EOF
      retry = {
        attempts = 5,
        delay    = "5s"
      },
    },
  ]

  labels = {
    type = "k8s"
  }
}
