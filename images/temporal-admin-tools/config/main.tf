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
    "tctl",
    "tdbg",
    "temporal",
    "temporal-cassandra-tool",
    "temporal-sql-tool",
    "temporal-server-schema"
  ]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
