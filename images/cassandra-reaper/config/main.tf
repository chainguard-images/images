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
