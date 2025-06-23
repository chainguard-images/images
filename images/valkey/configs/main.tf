module "accts" {
  name   = "valkey"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = [""]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : distinct(concat(var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/valkey-server"
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
      }
    ]
  })
}

