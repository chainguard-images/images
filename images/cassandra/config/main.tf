terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install."
  default     = ["cassandra-4.1", "cassandra-4.1-compat", "openjdk-11-default-jvm"]
}

variable "environment" {
  description = "Additional environment variables to set in the image."
  type        = map(string)
  default     = {}
}

data "apko_config" "this" {
  config_contents = yamlencode(merge(
    yamldecode(file("${path.module}/template.apko.yaml")),
    { environment = var.environment },
  ))
  extra_packages = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
