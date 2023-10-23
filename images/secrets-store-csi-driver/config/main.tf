variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["secrets-store-csi-driver", "mount"]
}

module "accts" {
  source = "../../../tflib/accts"
  run-as = 0 # run as root
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/secrets-store-csi"
    }
  })
}
