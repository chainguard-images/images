module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["cert-manager-webhook-pdns"]
  description = "The additional packages to install"
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "webhook"
    },
    "accounts" : module.accts.block,
    "environment" : {
      "GROUP_NAME" : "acme.zacharyseguin.ca"
    }
  })
}

