locals {
  baseline_packages = ["libsystemd"]
}

module "accts" {
  name   = "promtail"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["promtail"]
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
      "command" : "/usr/bin/promtail"
    },
    "cmd" : "-config.file=/etc/promtail/config.yml",
    "accounts" : module.accts.block
  })
}

