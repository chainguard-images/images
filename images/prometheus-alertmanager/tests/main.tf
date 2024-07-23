terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

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

  name      = "alertmanager"
  repo      = "https://prometheus-community.github.io/helm-charts"
  chart     = "alertmanager"
  namespace = "alertmanager"

  values = {
    image = {
      repository = local.parsed.registry_repo
      tag        = local.parsed.pseudo_tag
    }
    config = {
      global = {
        resolve_timeout = "11m"
        pagerduty_url   = "https://example-pagerduty.com/v2/test"
      }
      route = {
        group_by        = ["alertname"]
        group_wait      = "10s"
        group_interval  = "10m"
        repeat_interval = "1h"
        receiver        = "web.hook"
      }
      receivers = [{
        name            = "web.hook"
        webhook_configs = [{ url = "http://example.com/hook" }]
      }]
    }
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
    },
    {
      name = "Smoketest"
      cmd  = "$WORK/smoketest.sh ${module.helm.release_name}"
      retry = {
        attempts = 5
        delay    = "5s"
        factor   = 1.5
      }
    }
  ]

  labels = {
    type = "k8s"
  }
}
