locals {
  baseline_packages = []
}

module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["prometheus"]
  description = "The additional packages to install (e.g. promtail)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "prometheus"
    },
    "accounts" : module.accts.block
    "paths" = [
      {
        path        = "/data",
        type        = "directory",
        permissions = 511
      }
    ]
  })
}


