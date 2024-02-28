terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "main_package" {
  description = "Main package to install."
  type        = string
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = [var.main_package, "cass-operator-config", "libstdc++"]
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/vector"
    }
  })
}
