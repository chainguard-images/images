locals {
  baseline_packages = ["metacontroller"]
}

module "accts" {
  name   = "metacontroller"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["metacontroller"]
  description = "The additional packages to install (e.g. metacontroller)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/metacontroller"
    },
    "accounts" : module.accts.block
  })
}

