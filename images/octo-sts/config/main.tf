module "accts" {
  source = "../../../tflib/accts"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  default     = ["octo-sts"]
  description = "The additional packages to install (e.g. octo-sts)."
}

variable "binary" {
  default     = "octo-sts"
  description = "The binary to run."
}

output "config" {
  value = jsonencode({
    "contents" : {
      "packages" : distinct(var.extra_packages)
    },
    "entrypoint" : {
      "command" : "/usr/bin/${var.binary}"
    },
    "accounts" : module.accts.block
  })
}

