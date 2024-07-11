module "accts" {
  gid    = 999
  name   = "cassandra"
  run-as = 999
  source = "../../../tflib/accts"
  uid    = 999
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["grpc-health-probe", "py3-cassandra-medusa", "py3-cassandra-medusa-compat"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/home/cassandra/docker-entrypoint.sh"
    },
    "work-dir" : "/home/cassandra/",
    "accounts" : module.accts.block,
    "environment" : {
      "DEBUG_SLEEP" : "0",
      "DEBUG_VERSION" : "1",
      "LANG" : "C.UTF-8",
      "LC_ALL" : "C.UTF-8",
      "PATH" : "/usr/share/medusa/.venv/bin:usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    },
    "paths" : [
      {
        "path" : "/home/cassandra",
        "type" : "directory",
        "uid" : 999,
        "gid" : 999,
        "permissions" : 493,
        "recursive" : true
      }
    ]
  })
}

