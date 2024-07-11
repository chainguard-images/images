locals {
  baseline_packages = ["kmod", "openjdk-8", "openjdk-8-default-jvm", "tini"]
}

module "accts" {
  run-as = 0
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["newrelic-infrastructure-agent", "newrelic-infrastructure-bundle"]
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
      "command" : "/sbin/tini --"
    },
    "cmd" : "/usr/bin/newrelic-infra-service",
    "accounts" : module.accts.block,
    "environment" : {
      "NRIA_IS_CONTAINERIZED" : "true",
      "NRIA_OVERRIDE_HOST_ROOT" : "/host"
    }
  })
}

