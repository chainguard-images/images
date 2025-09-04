module "accts" {
  source = "../../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["hugo"]
  description = "The additional packages to install (e.g. hugo)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      // TODO: remove the need for using hardcoded local.baseline_packages by plumbing
      // these packages through var.extra_packages in all callers of this config module
      "packages" : var.extra_packages,
    },
    "entrypoint" : {
      "command" : "/usr/bin/hugo"
    },
    "work-dir" : "/hugo",
    "accounts" : module.accts.block,
    "paths" : [
      {
        "path" : "/hugo",
        "type" : "directory",
        "uid" : 65532,
        "gid" : 65532,
        "permissions" : 509
      }
    ]
  })
}

