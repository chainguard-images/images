terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

locals {
  components = {
    "fluent-bit-output" = {
      main_package   = "newrelic-fluent-bit-output${var.suffix}"
      extra_packages = ["newrelic-fluent-bit-output-compat"]
    },
    "infrastructure-bundle" = {
      main_package   = "newrelic-infrastructure-bundle${var.suffix}"
      extra_packages = ["newrelic-infrastructure-agent"]
    },
    "k8s-events-forwarder" = {
      main_package   = "newrelic-infrastructure-agent${var.suffix}"
      extra_packages = []
    },
    "kube-events" = {
      main_package   = "newrelic-nri-kube-events${var.suffix}"
      extra_packages = []
    },
    "kubernetes" = {
      main_package   = "nri-kubernetes${var.suffix}"
      extra_packages = []
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
