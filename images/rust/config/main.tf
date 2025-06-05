module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["rust", "build-base", "busybox", "cargo-auditable", "rust-audit-info"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/rustc"
    },
    "cmd" : "--help",
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

