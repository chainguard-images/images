module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["sqlpad", "sqlpad-compat"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "node server.js --config ./config.dev.env"
    },
    "work-dir" : "/usr/app/sqlpad-server",
    "accounts" : module.accts.block,
    "environment" : {
      "NODE_ENV" : "production",
      "SQLPAD_DB_PATH" : "/var/lib/sqlpad",
      "SQLPAD_PORT" : "3000"
    },
    "paths" : [
      {
        "path" : "/var/lib/sqlpad",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511,
        "recursive" : true
      },
      {
        "path" : "/usr/app/sqlpad-server",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511,
        "recursive" : true
      }
    ]
  })
}

