variable "dotnet_runtime_version" {
  description = "The .NET runtime version."
  type        = string
}

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
    # copied from crane config mcr.microsoft.com/dotnet/aspnet:9.0 |jq .config
    environment = {
      APP_UID                     = module.accts.uid,
      ASPNETCORE_HTTP_PORTS       = 8080,
      DOTNET_RUNNING_IN_CONTAINER = true,
      DOTNET_VERSION              = var.dotnet_runtime_version
      ASPNET_VERSION              = var.dotnet_runtime_version
    }
  })
}
