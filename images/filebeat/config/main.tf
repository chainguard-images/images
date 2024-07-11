locals {
  baseline_packages = ["bash", "busybox", "curl"]
}

module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["filebeat"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/sbin/tini -- /usr/local/bin/docker-entrypoint"
    },
    "cmd" : "-environment container",
    "work-dir" : "/usr/share/filebeat",
    "accounts" : module.accts.block,
    "environment" : {
      "ELASTIC_CONTAINER" : "true",
      "LIBBEAT_MONITORING_CGROUPS_HIERARCHY_OVERRIDE" : "/",
      "PATH" : "/usr/share/filebeat:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    },
    "paths" : [
      {
        "path" : "/usr/share/filebeat/logs/",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511,
        "recursive" : true
      },
      {
        "path" : "/usr/share/filebeat/data/",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511,
        "recursive" : true
      }
    ]
  })
}

