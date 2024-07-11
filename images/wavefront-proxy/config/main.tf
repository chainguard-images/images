locals {
  baseline_packages = ["bash", "busybox", "openjdk-11-default-jvm", "openjdk-11-jre"]
}

module "accts" {
  name   = "wavefront"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["wavefront-proxy", "wavefront-proxy-compat", "wavefront-proxy-config", "wavefront-proxy-licenses"]
  description = "The additional packages to install (e.g. crane)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/local/bin/run.sh"
    },
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/var/spool/wavefront-proxy",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511,
        "recursive" : true
      },
      {
        "path" : "/var/log/wavefront",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511,
        "recursive" : true
      }
    ]
  })
}

