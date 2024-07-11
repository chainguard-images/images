locals {
  baseline_packages = ["bash", "glibc-locale-en", "tzdata"]
}

module "accts" {
  gid    = 999
  name   = "rabbitmq"
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
  default     = ["rabbitmq-server"]
  description = "The additional packages to install."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/sbin/rabbitmq-server"
    },
    "work-dir" : "/var/lib/rabbitmq",
    "accounts" : module.accts.block,
    "environment" : {
      "HOME" : "/var/lib/rabbitmq",
      "LANG" : "en_US.UTF-8",
      "PATH" : "/usr/sbin:/sbin:/usr/bin:/bin:/usr/lib/rabbitmq/bin/",
      "RABBITMQ_ADVANCED_CONFIG_FILE" : "/etc/rabbitmq/advanced.config",
      "RABBITMQ_CONFIG_FILE" : "/etc/rabbitmq/rabbitmq.conf",
      "RABBITMQ_CONF_ENV_FILE" : "/etc/rabbitmq/rabbitmq-env.conf"
    },
    "paths" : [
      {
        "path" : "/var/lib/rabbitmq",
        "type" : "directory",
        "uid" : 999,
        "gid" : 999,
        "permissions" : 511,
        "recursive" : true
      },
      {
        "path" : "/app",
        "type" : "directory",
        "uid" : 999,
        "gid" : 999,
        "permissions" : 511
      },
      {
        "path" : "/var/lib/rabbitmq/mnesia",
        "type" : "directory",
        "uid" : 999,
        "gid" : 999,
        "permissions" : 511
      },
      {
        "path" : "/var/log/rabbitmq",
        "type" : "directory",
        "uid" : 999,
        "gid" : 999,
        "permissions" : 511
      },
      {
        "path" : "/home/rabbitmq",
        "type" : "directory",
        "uid" : 999,
        "gid" : 999,
        "permissions" : 511
      },
      {
        "path" : "/var/log/rabbitmq/rabbit",
        "type" : "directory",
        "uid" : 999,
        "gid" : 999,
        "permissions" : 511
      }
    ]
  })
}

