variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = []
}

variable "extra_repositories" {
  description = "Extra repositories to add."
  type        = list(string)
  default     = []
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      repositories = var.extra_repositories
      packages     = concat(["glibc", "libgcc", "libstdc++"], var.extra_packages)
    }
    accounts = module.accts.block
  })
}
