locals {
  baseline_packages = ["deno"]
}

module "accts" {
  name   = "deno"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = []
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
      "command" : "/usr/bin/deno"
    },
    "cmd" : "--help",
    "work-dir" : "/app",
    "accounts" : module.accts.block,
    "environment" : {
      "PATH" : "/usr/sbin:/sbin:/usr/bin:/bin"
    },
    "paths" : [
      {
        "path" : "/app",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      }
    ]
  })
}

