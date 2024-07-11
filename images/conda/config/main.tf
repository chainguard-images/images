locals {
  baseline_packages = ["busybox"]
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["conda", "conda-base", "conda-wrapper"]
  description = "The additional packages to install (e.g. conda)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/conda-wrapper"
    },
    "cmd" : "--help",
    "accounts" : {
      "run-as" : "0"
    }
  })
}

