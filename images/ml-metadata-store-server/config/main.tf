variable "extra_packages" {
  description = "The additional packages to install"
  type        = list(string)
  default     = ["ml-metadata-store-server"]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/metadata_store_server"
    }
  })
}
