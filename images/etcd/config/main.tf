variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["etcd"]
}

variable "environment" {
  description = "Additional environment variables to set in the image."
  type        = map(string)
  default     = {}
}

module "accts" {
  source = "../../../tflib/accts"

  # Match the upstream image's run-as
  run-as = 0
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    cmd      = "/usr/bin/etcd"
  })
}
