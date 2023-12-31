variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["oauth2-proxy"]
}

module "accts" {
  source = "../../../tflib/accts"
  name   = "oauth2-proxy"
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/oauth2-proxy"
    }
  })
}
