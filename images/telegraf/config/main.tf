variable "extra_packages" {
  default     = ["telegraf"]
  description = "Additional packages to install."
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
      command = "/usr/bin/telegraf"
    }
  })
}

