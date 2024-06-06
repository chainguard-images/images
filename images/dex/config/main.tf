terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install"
  // TODO: Add any other packages here you want to conditionally include,
  // or update this default to [] if this isn't a version stream image.
  default = [
    "dex",
  ]
}

locals {
  required_packages = ["gomplate"] // gomplate is required by dex
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = concat(var.extra_packages, local.required_packages)
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
