module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["kubernetes-csi-external-resizer"]
  description = "The additional packages to install (e.g. kubernetes-csi-external-resizer)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/csi-resizer"
    },
    "accounts" : module.accts.block
  })
}

