locals {
  baseline_packages = ["percona-server-8.3-oci-entrypoint", "percona-server-8.3-oci-entrypoint-compat", "tzdata"]
}

module "accts" {
  name   = "mysql"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["percona-server-8.3"]
  description = "The additional packages to install "
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/local/bin/docker-entrypoint.sh mysqld"
    },
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/var/lib/mysql",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      },
      {
        "path" : "/var/tmp",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      },
      {
        "path" : "/run/mysqld",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      },
      {
        "path" : "/docker-entrypoint-initdb.d",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      }
    ]
  })
}

