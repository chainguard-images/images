terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. kafka)."
  default     = ["kafka", "openjdk-11-default-jvm"]
}

variable "environment" {
  default = {}
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(merge(
    {
      environment = var.environment
    },
    data.apko_config.this.config,
  ))
}
