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

locals { parsed = { for k, v in var.digests : k => provider::oci::parse(v) } }

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
  namespace = "kyverno"
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
  ]

  labels = {
    type = "k8s"
  }
}
