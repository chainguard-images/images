locals {
  baseline_packages = ["prometheus-config-reloader-oci-entrypoint-compat"]
}

module "accts" {
  name   = "prometheus-config-reloader"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["prometheus-config-reloader"]
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
      "command" : "/bin/prometheus-config-reloader"
    },
    "accounts" : module.accts.block
  })
}

