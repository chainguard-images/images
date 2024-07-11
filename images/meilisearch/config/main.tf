locals {
  baseline_packages = ["meilisearch"]
}

module "accts" {
  gid    = 999
  name   = "meilisearch"
  run-as = 999
  source = "../../../tflib/accts"
  uid    = 999
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["meilisearch"]
  description = "The additional packages to install (e.g. meilisearch)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/meilisearch"
    },
    "cmd" : "--help",
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/var/data.ms",
        "type" : "directory",
        "uid" : 999,
        "gid" : 999,
        "permissions" : 493
      }
    ]
  })
}

