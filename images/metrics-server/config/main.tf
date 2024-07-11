module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["metrics-server"]
  description = "The additional packages to install (e.g. metrics-server)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "metrics-server --cert-dir=/tmp"
    },
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/tmp",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      }
    ]
  })
}

