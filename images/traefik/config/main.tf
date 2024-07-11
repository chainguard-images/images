module "accts" {
  name   = "traefik"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["traefik"]
  description = "The additional packages to install."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/traefik"
    },
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/tmp",
        "type" : "directory",
        "permissions" : 511
      }
    ]
  })
}

