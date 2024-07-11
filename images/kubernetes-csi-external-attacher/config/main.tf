module "accts" {
  run-as = 0
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["kubernetes-csi-external-attacher"]
  description = "The additional packages to install (e.g. kubernetes-csi-external-attacher)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/csi-attacher"
    },
    "accounts" : module.accts.block
  })
}

