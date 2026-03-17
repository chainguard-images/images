variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = []
}

variable "extra_repositories" {
  description = "The additional repositores to install from (e.g. extras)."
  default     = []
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat([
        "chainctl",
      ], var.extra_packages)
      repositories = var.extra_repositories
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/chainctl"
    }
  })
}
