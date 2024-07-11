terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["proxysql"]
  description = "The additional packages to install."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/proxysql"
    },
    "cmd" : "--initial --idle-threads -f -c /etc/proxysql.cnf",
    "accounts" : {
      "users" : [
        {
          "username" : "proxysql",
          "uid" : 65532
        }
      ],
      "groups" : [
        {
          "groupname" : "proxysql",
          "gid" : 65532
        }
      ]
    },
    "paths" : [
      {
        "path" : "/var/lib/proxysql",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      }
    ]
  })
}

