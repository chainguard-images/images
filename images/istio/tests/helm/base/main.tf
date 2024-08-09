terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "chart_version" {}

variable "values" {
  type = any
  default = {
    namespace = "istio-system"

    global = {
      istioNamespace = "istio-system"
    }
  }
}

module "helm" {
  source = "../../../../../tflib/imagetest/helm"

  namespace = var.values.namespace

  chart         = "base"
  repo          = "https://istio-release.storage.googleapis.com/charts/"
  chart_version = var.chart_version

  values = var.values
}

output "install_cmd" {
  value = module.helm.install_cmd
}

output "release_name" {
  value = module.helm.release_name
}
