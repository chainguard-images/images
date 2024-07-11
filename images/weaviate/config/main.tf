locals {
  baseline_packages = ["openssl", "weaviate"]
}

module "accts" {
  name   = "weaviate"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["weaviate"]
  description = "The additional packages to install (e.g. weaviate)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : distinct(concat(local.baseline_packages, var.extra_packages))
    },
    "entrypoint" : {
      "command" : "/bin/weaviate"
    },
    "cmd" : "--host 0.0.0.0 --port 8080 --scheme http",
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/modules",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 511
      },
      {
        "path" : "/var/lib/weaviate",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      }
    ]
  })
}

