module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = [""]
  description = "The additional packages to install (e.g. malcontent)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/mal"
    },
    "cmd" : "--help"
    "accounts" : module.accts.block
  })
}

