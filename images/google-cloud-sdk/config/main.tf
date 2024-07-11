locals {
  baseline_packages = ["apk-tools", "bash", "busybox", "google-cloud-sdk"]
}

module "accts" {
  name   = "gcloud"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["google-cloud-sdk"]
  description = "The additional packages to install (e.g. google-cloud-sdk)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {},
    "cmd" : "/usr/bin/gcloud",
    "accounts" : module.accts.block
  })
}

