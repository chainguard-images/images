locals {
  baseline_packages = ["bash", "buck2", "build-base", "busybox", "clang-15", "git", "llvm-lld"]
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
  default     = ["buck2"]
  description = "The additional packages to install (e.g. buck2)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/buck2"
    },
    "cmd" : "help",
    "accounts" : module.accts.block
  })
}

