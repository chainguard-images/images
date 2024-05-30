terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "component" { type = string }

variable "extra_packages" {
  type    = list(string)
  default = []
}

data "apko_config" "config" {
  config_contents = file("${path.module}/latest.${var.component}.apko.yaml")

  // This lets us set per-component default packages, which can be overridden by
  // var.extra_packages on a per-component basis.
  extra_packages = length(var.extra_packages) > 0 ? var.extra_packages : lookup({
    calicoctl             = ["calicoctl"]
    node                  = ["calico-node"]
    kube-controllers      = ["calico-kube-controllers"]
    cni                   = ["calico-cni", "calico-cni-compat"]
    csi                   = ["calico-pod2daemon"]
    typha                 = ["calico-typhad"]
    pod2daemon            = ["calico-pod2daemon"]
    node-driver-registrar = ["kubernetes-csi-node-driver-registrar"]
    apiserver             = ["calico-apiserver"]
    key-cert-provisioner  = ["calico-key-cert-provisioner"]
  }, var.component)
}

output "config" { value = jsonencode(data.apko_config.config.config) }
