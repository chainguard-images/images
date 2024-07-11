module "accts" {
  run-as = 0
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["coreutils", "dash", "multus-cni", "multus-cni-compat"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/thin_entrypoint"
    },
    "accounts" : module.accts.block
  })
}

