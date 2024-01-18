variable "extra_packages" {
  description = "Extra packages to install."
  type        = list(string)
  default     = []
}

module "accts" { source = "../../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["busybox"], var.extra_packages)
    }
    accounts = module.accts.block
  })
}
