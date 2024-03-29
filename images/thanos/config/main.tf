variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["thanos"]
}

module "accts" {
  source = "../../../tflib/accts"
  name   = "thanos"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/thanos"
    }
  })
}
