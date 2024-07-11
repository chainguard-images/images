locals {
  baseline_packages = ["bash", "build-base", "busybox", "file", "gcc", "git", "jq", "openssh-client", "patch", "python3", "zip"]
}

module "accts" {
  name   = "bazel"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = []
  description = "Additional packages to install."
  type        = list(string)
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/bazel"
    },
    "work-dir" : "/home/bazel",
    "accounts" : module.accts.block,
    "environment" : {
      "JAVA_HOME" : "/usr/lib/jvm/default-jvm"
    }
  })
}

