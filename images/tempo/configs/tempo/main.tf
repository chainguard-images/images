module "accts" {
  source = "../../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["tempo"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/tempo"
    },
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/var/tempo",
        "type" : "directory",
        "uid" : 10001,
        "gid" : 10001,
        "permissions" : 493,
        "recursive" : true
      }
    ]
  })
}

