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

variable "extra_env" {
  description = "The additional environment variables to set"
  default     = {}
  type        = map(string)
}

data "apko_config" "this" {
  config_contents = merge(
    file("${path.module}/template.apko.yaml"),
    { environment = var.extra_env }
  )
  extra_packages = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
