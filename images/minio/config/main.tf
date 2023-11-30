variable "extra_packages" {
  description = "The additional packages to install"
}

variable "entrypoint" {
  description = "The entrypoint to use for the image"
}

module "accts" {
  source = "../../../tflib/accts"
  name   = "minio"
  uid    = 1000
  gid    = 1000
  run-as = 1000
}

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
