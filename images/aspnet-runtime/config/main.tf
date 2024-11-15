variable "extra_packages" {
  description = "Additional packages to install."
  type        = list(string)
  default     = ["dotnet-9", "dotnet-9-runtime", "aspnet-9-runtime"]
}

module "accts" { source = "../../../tflib/accts" }

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    }
    accounts = module.accts.block
    entrypoint = {
      command = "/usr/bin/dotnet"
    }
    cmd = "--help"
  })
}
