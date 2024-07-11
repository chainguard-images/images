locals {
  baseline_packages = ["busybox", "glibc-locale-en"]
}

module "accts" {
  name   = "maven"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["maven", "openjdk-17", "openjdk-17-default-jvm"]
  description = "The additional packages to install"
}

variable "java_home" {
  default     = "/usr/lib/jvm/java-17-openjdk"
  description = "The JAVA_HOME to set"
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/mvn"
    },
    "work-dir" : "/home/build",
    "accounts" : module.accts.block,
    "environment" : {
      "LANG" : "en_US.UTF-8"
    },
    "paths" : [
      {
        "path" : "/home/build",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      }
    ]
  })
}

