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
    name             = "istio-system-istiod"
    namespace        = "istio-system"
    create_namespace = true
    revision         = "istio-system"

    pilot = {
      image = "cgr.dev/chainguard/istio-pilot"
      tag   = "latest"
    }
    global = {
      istioNamespace = "istio-system"
      hub            = "cgr.dev/chainguard/istio-proxy"
      proxy = {
        image = "cgr.dev/chainguard/istio-proxy"
      }
      proxy-init = {
        image = "cgr.dev/chainguard/istio-proxy"
      }
      tag = "latest"
    }
    version = "1.19.0"

  }
}

module "helm" {
  source = "../../../../../tflib/imagetest/helm"

  namespace = var.values.namespace

  repo          = "https://istio-release.storage.googleapis.com/charts/"
  chart         = "istiod"
  chart_version = var.chart_version

  values = var.values
}

output "install_cmd" {
  value = module.helm.install_cmd
}

output "release_name" {
  value = module.helm.release_name
}
