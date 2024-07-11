locals {
  baseline_packages = ["influxd", "influxd-oci-entrypoint"]
}

module "accts" {
  gid    = 1000
  name   = "influxdb"
  run-as = 1000
  source = "../../../tflib/accts"
  uid    = 1000
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["influx"]
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
      "command" : "/usr/bin/entrypoint.sh"
    },
    "accounts" : module.accts.block,
    "environment" : {
      "DOCKER_INFLUXDB_INIT_CLI_CONFIG_NAME" : "default",
      "INFLUXD_INIT_PING_ATTEMPTS" : "600",
      "INFLUXD_INIT_PORT" : "9999"
    },
    "paths" : [
      {
        "path" : "/var/lib/influxdb2",
        "type" : "directory",
        "uid" : 1000,
        "gid" : 1000,
        "permissions" : 493
      },
      {
        "path" : "/etc/influxdb2",
        "type" : "directory",
        "uid" : 1000,
        "gid" : 1000,
        "permissions" : 493
      }
    ]
  })
}

