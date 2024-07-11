locals {
  baseline_packages = ["busybox", "curl", "su-exec"]
}

module "accts" {
  name   = "consul"
  run-as = 0
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = []
  description = "The additional packages to install (e.g. consul)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "repositories" : [
        "https://packages.cgr.dev/extras"
      ],
      "keyring" : [
        "https://packages.cgr.dev/extras/chainguard-extras.rsa.pub"
      ],
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/docker-entrypoint.sh"
    },
    "cmd" : "agent -dev -client 0.0.0.0",
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/consul",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      },
      {
        "path" : "/consul/data",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      },
      {
        "path" : "/consul/config",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      }
    ]
  })
}

