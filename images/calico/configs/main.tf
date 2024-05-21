terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "component" { type = string }

locals {
  // This lets us set per-package default packages, which can be overridden by
  // var.extra_packages on a per-component basis.
  packages = var.extra_packages != [] ? var.extra_packages : [{
    calicoctl             = "calicoctl"
    node                  = "calico-node"
    kube-controllers      = "calico-kube-controllers"
    cni                   = "calico-cni"
    csi                   = "calico-pod2daemon"
    typha                 = "calico-typhad"
    pod2daemon            = "calico-pod2daemon"
    node-driver-registrar = "kubernetes-csi-node-driver-registrar"
    apiserver             = "calico-apiserver"
  }[var.component]]
}

variable "extra_packages" {
  type    = list(string)
  default = []
}

data "apko_config" "config" {
  config_contents = file("${path.module}/latest.${var.component}.apko.yaml")
  extra_packages  = local.packages
}

output "config" { value = jsonencode(data.apko_config.config.config) }
