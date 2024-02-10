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
    "cassandra-reaper",
    "openjdk-11-default-jvm"
    // Other packages your image needs
  ]
}

variable "environment" {
  description = "The additional environment variables to set"
  default     = {}
  type        = map(string)
}

locals { decoded = yamldecode(file("${path.module}/template.apko.yaml")) }

data "apko_config" "this" {
  config_contents = yamlencode(merge(
    decoded,
    { environment = merge(decoded.environment, var.environment) },
  ))
  extra_packages = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
