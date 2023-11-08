variable "name" {
}

variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = []
}

module "accts" { source = "../../../tflib/accts" }

locals {
  binaries = {
    "server" = "timestamp-server"
    "cli"    = "timestamp-cli"
  }
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["timestamp-authority-${var.name}"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/${local.binaries["${var.name}"]}"
    }
  })
}
