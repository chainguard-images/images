terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "values" {
  type = any
  default = {
    revision = "istio-system"
    pilot = {
      image = "cgr.dev/chainguard/istio-pilot"
      tag = "latest"
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
    version   = "1.19.0"
    namespace = "istio-system"
  }
}

module "helm" {
  source = "../../../../tflib/imagetest/helm"

  namespace = var.values.namespace
  repo      = "https://istio-release.storage.googleapis.com/charts/"
  chart     = "istiod"

  values = var.values
}

output "install_cmd" {
  value = module.helm.install_cmd
}

output "release_name" {
  value = module.helm.release_name
}
