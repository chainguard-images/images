locals {
  baseline_packages = ["busybox"]
}

module "accts" {
  source = "../../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["dotnet-sdk"]
  description = "The additional packages to install (e.g. dotnet-sdk, dotnet-7-sdk)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {},
    "cmd" : "/bin/sh -l",
    "accounts" : module.accts.block
  })
}

