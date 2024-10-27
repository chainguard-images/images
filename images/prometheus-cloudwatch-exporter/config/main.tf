locals {
  baseline_packages = ["busybox"]
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
  default     = ["cloudwatch-exporter", "openjdk-17-default-jvm", "openjdk-17-jre"]
  description = "The additional packages to install"
}

variable "entrypoint" {
  description = "The entrypoint to use for the container"
  type        = string
  default     = "/usr/bin/java -jar /usr/share/java/cloudwatch_exporter/cloudwatch_exporter.jar 9106"
}

variable "extra_environments" {
  description = "The additional environment variables to set"
  type        = map(string)
  default     = {}
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : var.entrypoint
    },
    "cmd" : "/config/config.yml",
    "accounts" : module.accts.block
    environment = var.extra_environments
  })
}

