module "accts" { source = "../../../tflib/accts" }

variable "extra_packages" {
  description = "The additional packages to install"
  type        = list(string)
  default     = ["cass-operator", "cass-operator-compat"]
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/manager"
    }
  })
}
