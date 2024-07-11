locals {
  baseline_packages = ["kube-downscaler", "python3"]
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
  default     = ["kube-downscaler"]
  description = "The additional packages to install (e.g. kube-downscaler)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "python3 -m kube_downscaler"
    },
    "accounts" : module.accts.block
  })
}

