variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = [""]
}

variable "main_package" {
  description = "The main package to install."
  type        = string
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["jitsucom-bulker-${var.main_package}", "jitsucom-bulker-${var.main_package}-compat"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/app/${var.main_package}"
    }
  })
}
