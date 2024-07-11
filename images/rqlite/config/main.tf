locals {
  baseline_packages = ["busybox", "rqlite", "rqlite-oci-entrypoint"]
}

module "accts" {
  name   = "rqlite"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["rqlite"]
  description = "The additional packages to install (e.g. rqlite)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/docker-entrypoint.sh"
    },
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/rqlite",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      }
    ]
  })
}

