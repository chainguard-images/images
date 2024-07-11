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
  default     = ["dockerize", "tctl", "tctl-authorization-plugin-compat", "tctl-compat", "temporal", "temporal-compat", "temporal-server", "temporal-server-compat", "temporal-server-oci-entrypoint"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/etc/temporal/entrypoint.sh"
    },
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

