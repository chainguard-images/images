locals {
  baseline_packages = ["fluent-bit", "libpq"]
}

module "accts" {
  run-as = 0
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["newrelic-fluent-bit-output", "newrelic-fluent-bit-output-compat"]
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
      "command" : "/usr/bin/fluent-bit"
    },
    "cmd" : "-c /fluent-bit/etc/fluent-bit.conf -e /fluent-bit/bin/out_newrelic.so",
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/var/lib/fluent-bit",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      }
    ]
  })
}

