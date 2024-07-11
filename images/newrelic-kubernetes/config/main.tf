locals {
  baseline_packages = ["bind-tools", "busybox", "tini"]
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["nri-kubernetes"]
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
      "command" : "/sbin/tini -- /usr/bin/nri-kubernetes"
    },
    "accounts" : {
      "run-as" : "1000",
      "users" : [
        {
          "username" : "nri",
          "uid" : 1000,
          "gid" : 2000
        }
      ],
      "groups" : [
        {
          "groupname" : "nri-agent",
          "gid" : 2000
        }
      ]
    },
    "environment" : {
      "METADATA" : "true"
    }
  })
}

