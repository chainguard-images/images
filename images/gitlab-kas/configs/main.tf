variable "extra_packages" {
  default     = []
  description = "The additional packages to install"
  type        = list(string)
}

module "accts" {
  source = "../../../tflib/accts"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/kas"
    }
  })
}

