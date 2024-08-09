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
    name      = "istio-system-cni"
    namespace = "istio-system"
    revision  = "istio-system"

    cni = {
      image      = "cgr.dev/chainguard/istio-install-cni"
      tag        = "latest"
      cniBinDir  = "/var/lib/rancher/k3s/data/current/bin"
      cniConfDir = "/var/lib/rancher/k3s/agent/etc/cni/net.d"
    }
    global = {
      hub = "cgr.dev/chainguard/istio-install-cni"
      tag = "latest"
    }
    version = "1.19.0"
  }
}

module "helm" {
  source = "../../../../../tflib/imagetest/helm"

  namespace = var.values.namespace

  repo          = "https://istio-release.storage.googleapis.com/charts/"
  chart         = "cni"
  chart_version = var.chart_version

  values = var.values
}

output "install_cmd" {
  value = module.helm.install_cmd
}

output "release_name" {
  value = module.helm.release_name
}
