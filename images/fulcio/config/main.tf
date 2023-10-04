variable "name" {
  description = "Package name (e.g. fulcio)"
  default     = "fulcio"
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
      packages = concat(["${var.name}${var.suffix}"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/${var.name}"
    }
  })
}
