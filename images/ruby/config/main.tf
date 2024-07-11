module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = []
  description = "The additional packages to install (e.g. ruby, ruby-3.2)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/ruby"
    },
    "cmd" : "--version",
    "work-dir" : "/work",
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/work",
        "type" : "directory",
        "permissions" : 511
      }
    ]
  })
}

