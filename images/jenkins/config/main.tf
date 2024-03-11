terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install."
  default     = ["jenkins", "openjdk-17-jre", "openjdk-17-default-jvm"]
}

variable "environment" {
  description = "Additional environment variables to set"
  default     = {}
  type        = map(string)
}

variable "extra_args" {
  description = "Additional java arguments to pass when invoking the jar."
  default     = [""]
}

locals {
  apko_config = yamldecode(file("${path.module}/template.apko.yaml"))
}

data "apko_config" "this" {
  config_contents = yamlencode(merge(
    local.apko_config,
    {
      environment = merge(local.apko_config.environment, var.environment),
    }
  ))
  extra_packages = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
