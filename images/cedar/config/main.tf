variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["cedar<=2.4.2"] //  Fails
  //default = ["cedar<2.4.2"] // Works
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/cedar"
    }
    cmd = "help"
  })
}
