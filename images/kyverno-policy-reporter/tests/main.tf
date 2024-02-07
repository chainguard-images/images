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

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
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
  namespace = "kyverno"
  repo      = "https://kyverno.github.io/policy-reporter"
  chart     = "policy-reporter"

  values = {
    image = {
      registry   = data.oci_string.ref["reporter"].registry
      repository = data.oci_string.ref["reporter"].repo
      tag        = data.oci_string.ref["reporter"].pseudo_tag
    }

    ui = {
      enabled = true
      plugins = {
        kyverno = true
      }
      image = {
        registry   = data.oci_string.ref["ui"].registry
        repository = data.oci_string.ref["ui"].repo
        tag        = data.oci_string.ref["ui"].pseudo_tag
      }
    }

    kyvernoPlugin = {
      enabled = true
      image = {
        registry   = data.oci_string.ref["plugin"].registry
        repository = data.oci_string.ref["plugin"].repo
        tag        = data.oci_string.ref["plugin"].pseudo_tag
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
