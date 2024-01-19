terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. openjdk-17-default-jvm)."
  default     = ["default-jvm"]
}

variable "environment" {
  default = {}
}

module "accts" {
  source = "../../../tflib/accts"
  name   = "java"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "glibc-locale-en",
        "libstdc++",
      ], var.extra_packages)
    }
    accounts = module.accts.block
    work-dir = "/app"
    environment = merge({
      "LANG" : "en_US.UTF-8",
      "JAVA_HOME" : "/usr/lib/jvm/default-jvm"
    }, var.environment)
    entrypoint = {
      command = "/usr/bin/java"
    }
  })
}
