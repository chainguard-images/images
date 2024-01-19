variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["thanos-operator"]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = concat(["thanos-operator-compat"], var.extra_packages)
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/manager"
    }
  })
}
