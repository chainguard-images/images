variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["policy-controller"]
}

module "accts" {
  source = "../../../tflib/accts"
}

output "config" {
  value = jsonencode({
    contents = { packages = var.extra_packages }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/policy-controller"
    }
  })
}
