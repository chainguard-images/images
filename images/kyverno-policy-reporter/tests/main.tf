terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    reporter = string
    ui       = string
    plugin   = string
  })
}

variable "chart-version" {
  description = "The image digests to run tests over."
  default     = ""
}

locals {
  parsed    = { for k, v in var.digests : k => provider::oci::parse(v) }
  namespace = "kyverno"
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "kyverno"
  inventory = data.imagetest_inventory.this
}

module "kyverno_helm" {
  source = "../../kyverno/tests/helm"
}

module "policy_reporter_helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "policy-reporter"
  namespace = local.namespace
  repo      = "https://kyverno.github.io/policy-reporter"
  chart     = "policy-reporter"

  values = {
    image = {
      registry   = local.parsed["reporter"].registry
      repository = local.parsed["reporter"].repo
      tag        = local.parsed["reporter"].pseudo_tag
    }

    ui = {
      enabled = true
      plugins = {
        kyverno = true
      }
      image = {
        registry   = local.parsed["ui"].registry
        repository = local.parsed["ui"].repo
        tag        = local.parsed["ui"].pseudo_tag
      }
    }

    kyvernoPlugin = {
      enabled = true
      image = {
        registry   = local.parsed["plugin"].registry
        repository = local.parsed["plugin"].repo
        tag        = local.parsed["plugin"].pseudo_tag
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the kyverno helm chart."

  steps = [
    {
      name = "Kyverno helm install"
      cmd  = module.kyverno_helm.install_cmd
    },
    {
      name = "Policy reporter helm install"
      cmd  = module.policy_reporter_helm.install_cmd
    },
    {
      name = "Wait for components to be ready"
      cmd  = "kubectl wait --for=condition=Ready pod -l app.kubernetes.io/name=policy-reporter -n ${local.namespace}"
      retry = {
        attempts = 3
      }
    },
    {
      name = "Look for policyreports"
      cmd  = "kubectl get policyreports"
      retry = {
        attempts = 3
      }
    },
    {
      name = "Wait for UI components to be ready"
      cmd  = "kubectl wait --for=condition=Ready pod -l app.kubernetes.io/name=ui -n ${local.namespace}"
      retry = {
        attempts = 3
      }
    },
    {
      name = "Try to access UI"
      cmd  = <<EOF
      apk add curl
      kubectl port-forward service/policy-reporter-ui 8082:8080 -n ${local.namespace} &
      sleep 1  # Give the port-forward time to start
      curl http://localhost:8082
      EOF
    }
  ]

  labels = {
    type = "k8s"
  }
}
