locals {
  baseline_packages = ["busybox", "opentelemetry-collector-contrib-compat"]
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
  default     = ["opentelemetry-collector-contrib"]
  description = "The additional packages to install."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/otelcol-contrib"
    },
    "accounts" : module.accts.block,
    "environment" : {
      "PORT" : "8080"
    },
    "paths" : [
      {
        "path" : "/conf",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      }
    ]
  })
}

