terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

module "accts" { source = "../../../tflib/accts" }

variable "extra_packages" {
  description = "The additional packages to install (e.g. memcached-exporter)."
  default     = ["memcached-exporter", "memcached-exporter-bitnami-compat"]
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    environment = {
      BITNAMI_APP_NAME = "memcached-exporter"
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/memcached_exporter"
    }
  })
}
