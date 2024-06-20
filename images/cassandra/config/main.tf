terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["cassandra", "cassandra-compat", "openjdk-11-default-jvm"]
  description = "The additional packages to install."
}

variable "environment" {
  default     = {}
  description = "Additional environment variables to set in the image."
  type        = map(string)
}

variable "extra_paths" {
  default     = []
  description = "Additional paths to configure in the image."
}

locals {
  decoded = yamldecode(file("${path.module}/template.apko.yaml"))
}

data "apko_config" "this" {
  config_contents = yamlencode(merge(
    local.decoded,
    { environment = merge(local.decoded.environment, var.environment)
      paths       = concat(local.decoded.paths, var.extra_paths)
    }
  ))
  extra_packages = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}

