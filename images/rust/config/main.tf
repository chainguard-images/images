locals {
  baseline_packages = ["build-base", "busybox"]
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
  default     = ["rust"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/rustc"
    },
    "cmd" : "--help",
    "work-dir" : "/work",
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/work",
        "type" : "directory",
        "permissions" : 511
      }
    ]
  })
}

