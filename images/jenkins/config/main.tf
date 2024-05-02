terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install."
  default     = ["jenkins", "openjdk-17-default-jvm", "jenkins-compat"]
}

variable "environment" {
  description = "Additional environment variables to set"
  default     = {}
  type        = map(string)
}

locals {
  apko_config = yamldecode(file("${path.module}/template.apko.yaml"))
}

data "apko_config" "this" {
  config_contents = yamlencode(merge(
    local.apko_config,
    {
      # Append additional environment variables.
      environment = merge(local.apko_config.environment, var.environment),
    }
  ))
  extra_packages = concat(var.extra_packages, ["jenkins-compat"])
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
