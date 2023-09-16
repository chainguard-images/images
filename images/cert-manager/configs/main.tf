terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "name" {
  description = "Package name"
}

variable "suffix" {
  description = "Package name suffix"
  default     = ""
}

locals {
  package_name = "cert-manager-${var.name}${var.suffix}"
}

data "apko_config" "this" {
  config_contents = file("${path.module}/latest.${var.name}.apko.yaml")
  extra_packages  = ["${local.package_name}"]
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
