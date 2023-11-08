variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["wolfi-base"]
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 0
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    cmd      = "/bin/sh -l"
  })
}
