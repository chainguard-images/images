variable "extra_packages" {
  description = "The additional packages to install"
}

variable "entrypoint" {
  description = "The entrypoint to use for the image"
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = var.entrypoint
    }
  })
}
