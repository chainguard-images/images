locals {
  baseline_packages = ["busybox", "opentelemetry-collector-contrib-compat"]
}

module "accts" {
  source = "../../../tflib/accts"
}

variable "extra_packages" {
  default     = [""]
  description = "The additional packages to install."
}

output "config" {
  value = jsonencode({
    "contents" : {
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

