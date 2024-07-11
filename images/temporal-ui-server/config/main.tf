module "accts" {
  name   = "ui-server"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["dockerize", "temporal-ui-server", "temporal-ui-server-oci-entrypoint"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/home/ui-server/start-ui-server.sh"
    },
    "work-dir" : "/home/ui-server/",
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/home/ui-server",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493,
        "recursive" : true
      }
    ]
  })
}

