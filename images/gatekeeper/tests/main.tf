terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "chart-version" {
  description = "The version of the Helm chart to install."
  default     = "latest"
}

variable "skip_crds" {
  description = "Deprecated: No longer used"
  default     = false
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "k3s" {
  name      = "gatekeeper"
  inventory = data.imagetest_inventory.this
}

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name          = "gatekeeper"
  repo          = "https://open-policy-agent.github.io/gatekeeper/charts"
  chart         = "gatekeeper"
  chart_version = var.chart-version
  namespace     = "gatekeeper-system"

  values = {
    preInstall = {
      crdRepository = {
        image = {
          repository = "openpolicyagent/gatekeeper-crds"
          tag        = "v${var.chart-version}"
        }
      }
    }
    image = {
      repository = local.parsed.registry_repo
      release    = local.parsed.pseudo_tag
    }
    validatingWebhookCheckIgnoreFailurePolicy = "Ignore"
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic installation test for gatekeeper helm chart"
  harness     = imagetest_harness_k3s.k3s

  steps = [
    {
      name = "Install gatekeeper"
      cmd  = module.helm.install_cmd
    },
  ]

  labels = {
    type = "k8s"
  }
}
