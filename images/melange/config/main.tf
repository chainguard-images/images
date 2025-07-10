locals {
  baseline_packages = ["bubblewrap", "wolfi-keys"]
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["melange"]
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
      "command" : "/usr/bin/melange"
    },
    "cmd" : "--help",
    "work-dir" : "/work",
    "paths" : [
      {
        "path" : "/work",
        "type" : "directory",
        "permissions" : 511
      }
    ]
  })
}

