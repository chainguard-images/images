module "accts" {
  name   = "hubble-ui-backend"
  source = "../../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["gops", "hubble-ui-backend"]
  description = "The additional packages to install (e.g. gops, cilium-operator-generic...)"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/backend"
    },
    "accounts" : module.accts.block,
    "environment" : {
      "GOPS_CONFIG_DIR" : "/etc/hubble-ui/gops"
    },
    "paths" : [
      {
        "path" : "/etc/hubble-ui/gops",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 493
      }
    ]
  })
}

