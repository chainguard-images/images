terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "test_repository" {
  description = "The docker repo root to use for sourcing test images."
}

variable "values" {
  type    = any
  default = {}
}

variable "chart_version" {
  description = "The version of the Helm chart to install"
  default     = ""
}

variable "sandbox_ref" {
  description = "The image digest to use for the test sandbox, this should have at least helm and bash."
  default     = null
}

locals {
  # We are unable to interpolate "${var.test_repository}" inside of variable defaults,
  # so we instead define the default here
  default_values = {
    installCRDs = true
    image = {
      repository = "${var.test_repository}/cert-manager-controller"
      tag        = "latest"
    }
    acmesolver = {
      image = {
        repository = "${var.test_repository}/cert-manager-acmesolver"
        tag        = "latest"
      }
    }
    cainjector = {
      image = {
        repository = "${var.test_repository}/cert-manager-cainjector"
        tag        = "latest"
      }
    }
    webhook = {
      image = {
        repository = "${var.test_repository}/cert-manager-webhook"
        tag        = "latest"
      }
    }
  }
}

# New cert-manager installation test using tflib/imagetest/tests/helm/
module "helm_cert_manager" {
  source        = "../tests/helm"
  sandbox_ref   = var.sandbox_ref
  name          = "cert-manager"
  namespace     = "cert-manager"
  chart         = "cert-manager"
  repo          = "https://charts.jetstack.io"
  chart_version = var.chart_version
  cg_values     = local.default_values
  values        = var.values
}

output "test" {
  value = module.helm_cert_manager.test
}
