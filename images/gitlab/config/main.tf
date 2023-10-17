terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "name" {
  description = "Package name (e.g. kas, sidekiq, ...)"
}

variable "suffix" {
  description = "Package name suffix (e.g. version stream)"
  default     = ""
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = []
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["gitlab-${var.name}${var.suffix}"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/${var.name}"
    }
  })
}
