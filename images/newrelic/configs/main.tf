terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

locals {
  components = {
    "infrastructure-bundle" = {
      main_package   = "newrelic-infrastructure-bundle${var.suffix}"
      extra_packages = ["newrelic-infrastructure-agent"]
    },
    "prometheus-configurator" = {
      main_package   = "newrelic-prometheus-configurator${var.suffix}"
      extra_packages = []
    },
    "prometheus" = {
      main_package   = "nri-prometheus${var.suffix}"
      extra_packages = []
    },
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
  extra_packages  = concat(["${local.components[var.name].main_package}"], local.components[var.name].extra_packages, var.extra_packages)
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}

output "main_package" {
  value = local.components[var.name].main_package
}
