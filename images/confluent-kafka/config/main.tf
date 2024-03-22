terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install"
  default = [
    "confluent-kafka",
    "confluent-kafka-images-kafka",
    "confluent-common-docker",
    "confluent-common-docker-base",
    "confluent-common-docker-ub",
    "confluent-docker-utils",
    "openjdk-17-default-jvm",
  ]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
