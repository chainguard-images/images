module "accts" {
  name   = "external-dns"
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["external-dns"]
  description = "The additional packages to install (e.g. external-dns)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "/usr/bin/external-dns"
    },
    "cmd" : "--help",
    "accounts" : module.accts.block
  })
}

