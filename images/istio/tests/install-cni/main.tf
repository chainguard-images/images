terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "values" {
  type = any
  default = {
    revision = "istio"
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
    version   = "1.19.0"
    namespace = "istio-system"
  }
}

module "helm" {
  source = "../../../../tflib/imagetest/helm"

  namespace = var.values.namespace
  name      = "istio-cni"
  repo      = "https://istio-release.storage.googleapis.com/charts/"
  chart     = "cni"

  values = var.values
}

output "install_cmd" {
  value = module.helm.install_cmd
}

output "release_name" {
  value = module.helm.release_name
}