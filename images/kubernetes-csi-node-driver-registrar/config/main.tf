module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["kubernetes-csi-node-driver-registrar", "kubernetes-csi-node-driver-registrar-compat"]
  description = "The additional packages to install (e.g. kubernetes-csi-node-driver-registrar, kubernetes-csi-node-driver-registrar-2.8)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/csi-node-driver-registrar"
    },
    "accounts" : module.accts.block
  })
}

