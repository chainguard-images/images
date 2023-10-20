terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

locals {
  packages = {
    "server"      = "argo-cd${var.suffix}"
    "repo-server" = "argo-cd${var.suffix}-repo-server"
  }
}

variable "name" {
  description = "Package name (e.g. server or repo-server)"
}

variable "suffix" {
  description = "Package name suffix (e.g. version stream)"
  default     = ""
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = []
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.${var.name}.apko.yaml")
  extra_packages  = concat(["busybox", local.packages[var.name], "argo-cd${var.suffix}-compat"], var.extra_packages)
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}

output "main_package" {
  value = local.packages[var.name]
}
