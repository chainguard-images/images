locals {
  baseline_packages = ["busybox", "py3-openai"]
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
  default     = ["py3-openai", "py3-openai-bin"]
  description = "The additional packages to install (e.g. py3-openai)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/openai"
    },
    "cmd" : "--help",
    "accounts" : module.accts.block
  })
}

