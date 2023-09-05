terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

# TODO: We should have a virtual package for tracking clang

variable "extra_packages" {
  description = "The additional packages to install (e.g. clang-15)."
  default     = ["clang-15", "clang-15-default"]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
