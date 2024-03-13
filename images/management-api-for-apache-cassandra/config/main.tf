terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "environment" {
  description = "Additional environment variables to set in the image."
  type        = map(string)
  default     = {}
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

variable "extra_paths" {
  description = "Additional paths to configure in the image."
  default     = []
}

locals { decoded = yamldecode(file("${path.module}/template.apko.yaml")) }

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
