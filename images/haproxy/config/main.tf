locals {
  baseline_packages = ["haproxy-oci-entrypoint"]
}

module "accts" {
  name   = "haproxy"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["dataplaneapi", "haproxy-2.9"]
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
      "command" : "/usr/local/bin/docker-entrypoint.sh"
    },
    "cmd" : "haproxy -f /usr/local/etc/haproxy/haproxy.cfg",
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/var/lib/haproxy",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      },
      {
        "path" : "/var/run",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      }
    ]
  })
}

