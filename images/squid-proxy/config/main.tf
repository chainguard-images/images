module "accts" {
  name   = "squid"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["squid"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/sbin/squid -N"
    },
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/var/log/squid",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511,
        "recursive" : true
      },
      {
        "path" : "/var/run",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511,
        "recursive" : true
      }
    ]
  })
}

