locals {
  baseline_packages = ["busybox"]
}

module "accts" {
  name   = "redis"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["redis", "redis-cli"]
  description = "The additional packages to install"
}

variable "extra_repositories" {
  description = "The additional repositores to install from (e.g. extras)."
  default     = ["https://packages.cgr.dev/extras"]
}

variable "extra_keyring" {
  description = "The additional keys to use (e.g. extras)."
  default     = ["https://packages.cgr.dev/extras/chainguard-extras.rsa.pub"]
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages)),
      "repositories" : var.extra_repositories,
      "keyring" : var.extra_keyring,
    },
    "entrypoint" : {
      "command" : "/usr/bin/redis-server"
    },
    "work-dir" : "/data",
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/data",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      }
    ]
  })
}

