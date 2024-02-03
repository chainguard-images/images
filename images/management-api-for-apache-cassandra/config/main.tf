terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install."
  default = [
    "management-api-for-apache-cassandra",
    "management-api-for-apache-cassandra-compat",
    "metric-collector-for-apache-cassandra",
    "cassandra",
    "cassandra-compat",
  "openjdk-11-default-jvm"]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
