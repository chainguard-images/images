terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
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
  description = "Used to deconflict between multiple installations within the same cluster."
  default     = false
}

data "oci_string" "ref" {
  input = var.digest
}

resource "random_pet" "suffix" {}

resource "helm_release" "gatekeeper" {
  name             = "gatekeeper-${random_pet.suffix.id}"
  namespace        = "gatekeeper-${random_pet.suffix.id}"
  create_namespace = true
  timeout          = 600

  repository = "https://open-policy-agent.github.io/gatekeeper/charts"
  chart      = "gatekeeper"

  version = var.chart-version == "latest" ? null : var.chart-version

  values = [jsonencode({
    preInstall = var.skip_crds ? null : {
      crdRepository = {
        image = {
          repository = "openpolicyagent/gatekeeper-crds"
          tag        = "v3.13.0-beta.1"
        }
      }
    }
    image = {
      repository = data.oci_string.ref.registry_repo
      release    = data.oci_string.ref.pseudo_tag
    }
    validatingWebhookCheckIgnoreFailurePolicy = "Ignore"
  })]
}

module "helm_cleanup" {
  source    = "../../../tflib/helm-cleanup"
  name      = helm_release.gatekeeper.id
  namespace = helm_release.gatekeeper.namespace
}
