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
    environment = {
      NODE_ENV = "production"
    }
    entrypoint = {
      command = "/usr/bin/npm start"
    }
  })
}
