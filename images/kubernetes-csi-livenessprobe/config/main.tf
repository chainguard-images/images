module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["kubernetes-csi-livenessprobe"]
  description = "The additional packages to install (e.g. kubernetes-csi-livenessprobe)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/livenessprobe"
    },
    "accounts" : module.accts.block
  })
}

