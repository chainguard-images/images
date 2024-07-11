module "accts" {
  gid    = 65534
  run-as = 65534
  source = "../../../tflib/accts"
  uid    = 65534
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["prometheus-operator"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/operator"
    },
    "accounts" : module.accts.block
  })
}

