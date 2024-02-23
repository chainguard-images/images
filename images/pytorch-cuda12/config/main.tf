terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["pytorch-cuda12"]
}

variable "extra_repositories" {
  description = "The additional repositores to install from (e.g. extras)."
  default     = ["https://packages.cgr.dev/extras"]
}

variable "extra_keyring" {
  description = "The additional keys to use (e.g. extras)."
  default     = ["https://packages.cgr.dev/extras/chainguard-extras.rsa.pub"]
}

variable "environment" {
  default = {}
}

module "accts" {
  source = "../../../tflib/accts"
}

output "config" {
  value = jsonencode({
    contents = {
      packages     = var.extra_packages
      repositories = var.extra_repositories
      keyring      = var.extra_keyring
    }
    accounts = module.accts.block
    environment = merge({
      "PATH" : "/usr/share/pytorch/.venv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    }, var.environment)
    entrypoint = {
      command = ""
    }
    archs = ["x86_64"]
  })
}
