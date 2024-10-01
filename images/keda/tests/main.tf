terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    keda                    = string
    keda-metrics-apiserver  = string
    keda-admission-webhooks = string
  })
}

variable "name" {
  default = "keda"
}

locals {
  parsed = { for k, v in var.digests : k => provider::oci::parse(v) }
}

data "imagetest_inventory" "this" {
}

resource "imagetest_harness_k3s" "this" {
  inventory = data.imagetest_inventory.this
  name      = var.name
  sandbox = {
    envs = {
      "SCRIPT_DIR" = "/tests"
    }
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }
}

module "install" {
  chart  = "keda"
  name   = "keda"
  repo   = "https://kedacore.github.io/charts"
  source = "../../../tflib/imagetest/helm"
  values = {
    image = {
      keda = {
        registry   = local.parsed["keda"].registry
        repository = local.parsed["keda"].repo
        tag        = local.parsed["keda"].pseudo_tag
      }
      metricsApiServer = {
        registry   = local.parsed["keda-metrics-apiserver"].registry
        repository = local.parsed["keda-metrics-apiserver"].repo
        tag        = local.parsed["keda-metrics-apiserver"].pseudo_tag
      }
      webhooks = {
        registry   = local.parsed["keda-admission-webhooks"].registry
        repository = local.parsed["keda-admission-webhooks"].repo
        tag        = local.parsed["keda-admission-webhooks"].pseudo_tag
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  description = "Basic functionality of the ${var.name} helm chart."
  harness     = imagetest_harness_k3s.this
  labels = {
    type = "k8s"
  }
  name = "Basic"
  steps = [
    {
      name = "Helm install"
      cmd  = module.install.install_cmd
    },
    {
      name = "Smoke test"
      cmd  = <<EOF
            bash /tests/smoke-test.sh
      EOF
    },
    {
      name = "querying scaledobject metrics"
      cmd  = <<EOF
        kubectl apply -f /tests/scaledobject.yaml
        kubectl get --raw "/apis/external.metrics.k8s.io/v1beta1"
        kubectl get scaledobject test-deployment -n default -o jsonpath={.status.externalMetricNames}
        kubectl get --raw "/apis/external.metrics.k8s.io/v1beta1/namespaces/default/s0-cron-UTC-0,1xxxx-0,5xxxx?labelSelector=scaledobject.keda.sh%2Fname%3Dtest-deployment"
        kubectl get scaledobject test-deployment -o jsonpath='{.status.health.*.status}' | grep Happy
      EOF
    },
  ]
}

