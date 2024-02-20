terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. opensearch-2)."
  default     = ["opensearch-2", "openjdk-17-jre-base", "openjdk-17-default-jvm"]
}

variable "environment" {
  description = "The additional environment variables to set"
  default     = {}
  type        = map(string)
}

locals { decoded = yamldecode(file("${path.module}/template.apko.yaml")) }
data "apko_config" "this" {
  config_contents = yamlencode(merge(
    local.decoded,
    { environment = merge(local.decoded.environment, var.environment) },
  ))
  extra_packages = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
