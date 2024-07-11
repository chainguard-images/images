locals {
  baseline_packages = ["busybox", "git"]
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
  default     = ["gitness"]
  description = "The additional packages to install (e.g. gitness)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/gitness"
    },
    "cmd" : "server",
    "accounts" : module.accts.block,
    "environment" : {
      "GITNESS_DATABASE_DATASOURCE" : "/data/database.sqlite",
      "GITNESS_DATABASE_DRIVER" : "sqlite3",
      "GITNESS_METRIC_ENABLED" : "false",
      "GITNESS_METRIC_ENDPOINT" : "https://stats.drone.ci/api/v1/gitness",
      "GITNESS_TOKEN_COOKIE_NAME" : "token",
      "GITRPC_SERVER_GIT_ROOT" : "/data",
      "XDG_CACHE_HOME" : "/data"
    },
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

