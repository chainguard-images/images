variable "name" {
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

locals {
  binaries = {
    "logserver" = "trillian_log_server"
    "logsigner" = "trillian_log_signer"
  }
}

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["trillian${var.suffix}-${var.name}"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/${local.binaries["${var.name}"]}"
    }
  })
}
