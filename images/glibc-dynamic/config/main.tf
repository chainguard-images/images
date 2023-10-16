variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = []
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["glibc", "libgcc", "libstdc++"], var.extra_packages)
    }
    accounts = module.accts.block
  })
}
