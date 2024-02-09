terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "environment" {
  default = {}
}

variable "extra_packages" {
  description = "The additional packages to install."
  default     = ["cass-config-builder", "bash", "busybox", "openjdk-8-default-jvm"]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages,
    },
    accounts = module.accts.block,
    environment = var.environment,
    entrypoint = {
      command = "/usr/local/bin/entrypoint",
    },
  })
}
