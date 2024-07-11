locals {
  baseline_packages = ["busybox", "curl", "tini"]
}

module "accts" {
  gid    = 1000
  name   = "temporal"
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
  default     = ["tctl", "tctl-authorization-plugin", "tctl-authorization-plugin-compat", "tctl-compat", "tdbg", "tdbg-compat", "temporal", "temporal-cassandra-tool", "temporal-cassandra-tool-compat", "temporal-compat", "temporal-server-schema", "temporal-sql-tool", "temporal-sql-tool-compat"]
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
      "command" : "/sbin/tini --"
    },
    "cmd" : "sleep infinity",
    "work-dir" : "/etc/temporal",
    "accounts" : module.accts.block,
    "environment" : {
      "TEMPORAL_HOME" : "/etc/temporal"
    },
    "paths" : [
      {
        "path" : "/etc/temporal",
        "type" : "directory",
        "uid" : 1000,
        "gid" : 1000,
        "permissions" : 493,
        "recursive" : true
      }
    ]
  })
}

