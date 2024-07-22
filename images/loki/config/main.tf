module "accts" {
  gid    = 10001
  name   = "loki"
  run-as = 10001
  source = "../../../tflib/accts"
  uid    = 10001
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = []
  description = "The additional packages to install (e.g. loki)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/loki"
    },
    "cmd" : "-config.file=/etc/loki/local-config.yaml",
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/loki",
        "type" : "directory",
        "uid" : 10001,
        "gid" : 10001,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/loki/rules",
        "type" : "directory",
        "uid" : 10001,
        "gid" : 10001,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/loki/rules-temp",
        "type" : "directory",
        "uid" : 10001,
        "gid" : 10001,
        "permissions" : 493,
        "recursive" : true
      }
    ]
  })
}

