terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. crossplane-xfn)."
  type        = list(string)
}

variable "entrypoint" {
  description = "The entrypoint of the image (e.g. /usr/bin/xfn)."
  type        = string
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = var.entrypoint
    }
  })
}
