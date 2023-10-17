variable "package" {
  description = "Package name (e.g. kyverno-policy-reporter, kyverno-policy-reporter-ui)"
}

variable "suffix" {
  description = "Package name suffix (e.g. version stream)"
  default     = ""
}

variable "entrypoint" {
  description = "The entrypoint command for the container"
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
      packages = concat(["${var.package}${var.suffix}", "${var.package}${var.suffix}-compat"], var.extra_packages)
    }
    accounts = module.accts.block
    work-dir = "/app"
    entrypoint = {
      command = var.entrypoint
    }
  })
}
