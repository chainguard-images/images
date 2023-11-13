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
      packages = var.extra_packages
    }
    accounts = module.accts.block
    work-dir = "/app"
    entrypoint = {
      command = var.entrypoint
    }
  })
}
