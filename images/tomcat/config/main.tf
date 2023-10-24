terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. tomcat-10)."
  default = [
    "tomcat-10",
    "tomcat-native",
    "openjdk-17",
    "openjdk-17-default-jvm",
  ]
}

variable "java_home" {
  description = "The JAVA_HOME environment variable."
  default     = "/usr/lib/jvm/java-17-openjdk"
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(merge(data.apko_config.this.config, {
    environment : {
      "JAVA_HOME" : var.java_home
    }
  }))
}
