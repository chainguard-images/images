module "accts" {
  name   = "tigera-operator"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["glibc", "tigera-operator"]
  description = "The additional packages to install (e.g. tigera-operator)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/operator"
    },
    "cmd" : "--help",
    "accounts" : module.accts.block
  })
}

