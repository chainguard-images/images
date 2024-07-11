module "accts" {
  gid    = 1001
  run-as = 1001
  source = "../../../tflib/accts"
  uid    = 1001
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["dex", "gomplate"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/docker-entrypoint"
    },
    "cmd" : "dex serve /etc/dex/config.docker.yaml",
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/var/dex",
        "type" : "directory",
        "uid" : 1001,
        "gid" : 1001,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/etc/dex",
        "type" : "directory",
        "uid" : 1001,
        "gid" : 1001,
        "permissions" : 493,
        "recursive" : true
      },
      {
        "path" : "/srv/dex",
        "type" : "directory",
        "uid" : 1001,
        "gid" : 1001,
        "permissions" : 493,
        "recursive" : true
      }
    ]
  })
}

