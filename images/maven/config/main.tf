terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install"
  default = [
    "maven",
    "openjdk-17",
    "openjdk-17-default-jvm",
  ]
}

variable "java_home" {
  description = "The JAVA_HOME to set"
  default     = "/usr/lib/jvm/java-17-openjdk"
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(merge(
    { environment = { "JAVA_HOME" = var.java_home } },
    data.apko_config.this.config,
  ))
}
