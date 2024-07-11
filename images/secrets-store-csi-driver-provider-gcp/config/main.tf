locals {
  baseline_packages = ["secrets-store-csi-driver-provider-gcp"]
}

module "accts" {
  name   = "secrets-store-csi-driver-provider-gcp"
  run-as = 0
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["secrets-store-csi-driver-provider-gcp"]
  description = "The additional packages to install (e.g. secrets-store-csi-driver-provider-gcp)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/secrets-store-csi-driver-provider-gcp"
    },
    "accounts" : module.accts.block
  })
}

