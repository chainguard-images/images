locals {
  baseline_packages = ["kuberay-operator", "kuberay-operator-compat"]
}

module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["kuberay-operator", "kuberay-operator-compat"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "manager"
    },
    "accounts" : module.accts.block
  })
}

