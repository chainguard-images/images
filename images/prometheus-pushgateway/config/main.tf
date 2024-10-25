locals {
  baseline_packages = []
}

module "accts" {
  source = "../../../tflib/accts"
  uid    = 65534
  gid    = 65534
  run-as = 65534
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["prometheus-pushgateway"]
  description = "The additional packages to install (e.g. promtail)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/pushgateway"
    },
    "accounts" : module.accts.block
    "paths" : [
      {
        "path" : "/pushgateway",
        "type" : "directory",
        "permissions" : 493,
      }
    ]
    "work-dir" : "/pushgateway"
  })
}


