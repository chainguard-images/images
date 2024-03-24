terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

locals {
  packages = {
    "sslocal"  = "shadowsocks-rust-sslocal${var.suffix}"
    "ssserver" = "shadowsocks-rust-ssserver${var.suffix}"
  }
}

variable "name" {
  description = "Package name"
}

variable "suffix" {
  description = "Package name suffix (e.g. version stream)"
  default     = ""
}

variable "extra_packages" {
  description = "The additional packages to install"
  default     = ["shadowsocks-rust"]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.${var.name}.apko.yaml")
  extra_packages  = concat([local.packages[var.name]], var.extra_packages)
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}

output "main_package" {
  value = local.packages[var.name]
}
