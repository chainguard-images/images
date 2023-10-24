terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. elasticsearch-7)."
  default = [
    "openjdk-17",
    "openjdk-17-default-jvm",
    "tomcat-native",
    "tomcat-10"
  ]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
