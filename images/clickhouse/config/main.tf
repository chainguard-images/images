locals {
  baseline_packages = ["clickhouse-compat"]
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["clickhouse"]
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
      "command" : "/usr/bin/clickhouse"
    },
    "cmd" : "help",
    "work-dir" : "/home/clickhouse",
    "accounts" : {
      "run-as" : "101",
      "users" : [
        {
          "username" : "clickhouse",
          "uid" : 101,
          "gid" : 101
        },
        {
          "username" : "clickhouse-bridge",
          "uid" : 999,
          "gid" : 999
        }
      ],
      "groups" : [
        {
          "groupname" : "clickhouse",
          "gid" : 101
        },
        {
          "groupname" : "clickhouse-bridge",
          "gid" : 999
        }
      ]
    },
    "environment" : {
      "CLICKHOUSE_CONFIG" : "/etc/clickhouse-server/config.xml",
      "CLICKHOUSE_DB" : "default",
      "CLICKHOUSE_DEFAULT_ACCESS_MANAGEMENT" : "1",
      "CLICKHOUSE_GID" : "101",
      "CLICKHOUSE_LOG" : "/var/log/clickhouse-server/clickhouse-server.log",
      "CLICKHOUSE_PASSWORD" : "",
      "CLICKHOUSE_UID" : "101",
      "CLICKHOUSE_USER" : "default"
    },
    "paths" : [
      {
        "path" : "/var/lib/clickhouse",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493
      },
      {
        "path" : "/var/log/clickhouse-server",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493
      },
      {
        "path" : "/home/clickhouse",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493
      },
      {
        "path" : "/docker-entrypoint-initdb.d",
        "type" : "directory",
        "uid" : 101,
        "gid" : 101,
        "permissions" : 493
      }
    ]
  })
}

