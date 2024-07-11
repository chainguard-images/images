module "accts" {
  name   = "bank-vaults"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["bank-vaults", "bank-vaults-template"]
  description = "The additional packages to install (e.g. bank-vaults)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/bank-vaults"
    },
    "accounts" : module.accts.block
  })
}

