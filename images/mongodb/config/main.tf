module "accts" {
  name   = "mongo"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = []
  description = "The additional packages to install (e.g. mongo, mongos)"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/mongod"
    },
    "work-dir" : "/data",
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/data",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      },
      {
        "path" : "/data/db",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      }
    ]
  })
}

