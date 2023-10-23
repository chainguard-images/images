terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install"
  default = [
    "temporal-server",
  ]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/temporal-server"
    }
  })
}
