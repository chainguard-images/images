terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

module "accts" { source = "../../../tflib/accts" }

variable "extra_packages" {
  description = "The additional packages to install (e.g. memcached)."
  default     = ["memcached"]
}

variable "entrypoint" {
  description = "The entrypoint to use."
  default     = "/usr/bin/memcached"
}

variable "environment" {
  description = "Environment variables to add to the image"
  default     = {}
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = var.entrypoint
    }
    environment = var.environment
  })
}
