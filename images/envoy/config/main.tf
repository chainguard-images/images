locals {
  baseline_packages = ["envoy-config", "envoy-oci-entrypoint", "su-exec"]
}

module "accts" {
  name   = "envoy"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["envoy"]
  description = "The additional packages to install (e.g. envoy vs envoy-fips...)"
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/var/lib/envoy/init/envoy-entrypoint.sh"
    },
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/etc/envoy",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      }
    ]
  })
}

