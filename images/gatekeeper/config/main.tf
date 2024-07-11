module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["gatekeeper", "gatekeeper-compat"]
  description = "The additional packages to install (e.g. crane)."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : var.extra_packages
    },
    "entrypoint" : {
      "command" : "manager"
    },
    "cmd" : "--help",
    "accounts" : module.accts.block
  })
}

