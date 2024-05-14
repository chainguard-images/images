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
  name      = "mimir"
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

  name          = "mimir"
  namespace     = "mimir"
  repo          = "https://grafana.github.io/helm-charts"
  chart         = "mimir-distributed"
  chart_version = "5.4.0-weekly.290"

}

resource "imagetest_feature" "rollout-operator-tests" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of Grafana Operator."

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Replace grafana-rollout-operator image with built one"
      cmd = <<EOF
      kubectl set image -n mimir deployment/mimir-rollout-operator rollout-operator="${data.oci_string.ref.registry_repo}:${data.oci_string.ref.pseudo_tag}"
    EOF    
    },
    {
      name  = "Ensure it comes up healthy"
      cmd   = <<EOF
        kubectl logs -n mimir --selector app=rollout-operator
        kubectl rollout status -n mimir deployment/mimir-rollout-operator --timeout=120s
      EOF
    },
    {
      name = "Check logs for grafana-rollout-operator"
      cmd  = "/tests/logs.sh"
    },
    {
      name = "Setting Labels and annotations for ingestor-zones"
      cmd = <<EOF
        kubectl label sts mimir-ingester-zone-a grafana.com/min-time-between-zones-downscale=2m -n mimir
        kubectl label sts mimir-ingester-zone-a grafana.com/prepare-downscale=true -n mimir
        kubectl annotate sts mimir-ingester-zone-a grafana.com/prepare-downscale-http-path=ingester/prepare-shutdown -n mimir
        kubectl annotate sts mimir-ingester-zone-a grafana.com/prepare-downscale-http-port=80 -n mimir

        kubectl label sts mimir-ingester-zone-b grafana.com/min-time-between-zones-downscale=2m -n mimir
        kubectl label sts mimir-ingester-zone-b grafana.com/prepare-downscale=true -n mimir
        kubectl annotate sts mimir-ingester-zone-b grafana.com/rollout-downscale-leader=mimir-ingester-zone-a -n mimir
        kubectl annotate sts mimir-ingester-zone-b grafana.com/prepare-downscale-http-path=ingester/prepare-shutdown -n mimir
        kubectl annotate sts mimir-ingester-zone-b grafana.com/prepare-downscale-http-port=80 -n mimir

        kubectl label sts mimir-ingester-zone-c grafana.com/min-time-between-zones-downscale=2m -n mimir
        kubectl label sts mimir-ingester-zone-c grafana.com/prepare-downscale=true -n mimir
        kubectl annotate sts mimir-ingester-zone-c grafana.com/rollout-downscale-leader=mimir-ingester-zone-b -n mimir
        kubectl annotate sts mimir-ingester-zone-c grafana.com/prepare-downscale-http-path=ingester/prepare-shutdown -n mimir
        kubectl annotate sts mimir-ingester-zone-c grafana.com/prepare-downscale-http-port=80 -n mimir
      EOF
    },
    {
      name = "Check logs for grafana-rollout-operator after labels and annotations"
      cmd  = "/tests/logs_functionality.sh"
    },
  ]

  labels = {
    type = "k8s"
  }
}
