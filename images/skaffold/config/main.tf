locals {
  baseline_packages = ["google-cloud-sdk", "helm", "kpt", "kustomize", "python3", "skaffold"]
}

module "accts" {
  name   = "skaffold"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["skaffold"]
  description = "The additional packages to install (e.g. skaffold)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/usr/bin/skaffold"
    },
    "cmd" : "--help",
    "work-dir" : "/app",
    "accounts" : module.accts.block,
    "environment" : {
      "PATH" : "/usr/sbin:/sbin:/usr/bin:/bin"
    },
    "paths" : [
      {
        "path" : "/app",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      }
    ]
  })
}

