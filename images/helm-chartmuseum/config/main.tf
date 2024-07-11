module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["chartmuseum"]
  description = "The additional packages to install (e.g. chartmuseum)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/chartmuseum"
    },
    "accounts" : module.accts.block,
    "environment" : {
      "DISABLE_API" : "true",
      "DISABLE_STATEFILES" : "true",
      "PORT" : "8080",
      "STORAGE" : "local",
      "STORAGE_LOCAL_ROOTDIR" : "/charts"
    },
    "paths" : [
      {
        "path" : "/charts",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      }
    ]
  })
}

