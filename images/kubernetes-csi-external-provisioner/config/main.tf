terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

module "accts" {
  run-as = 0
  source = "../../../tflib/accts"
}

variable "extra_packages" {
  default     = ["kubernetes-csi-external-provisioner"]
  description = "The additional packages to install (e.g. kubernetes-csi-external-provisioner)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/csi-provisioner"
    },
    "accounts" : module.accts.block
  })
}

