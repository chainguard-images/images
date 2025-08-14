module "accts" {
  source = "../../../../tflib/accts"
}

variable "dotnet_runtime_version" {
  description = "The .NET runtime version."
  type        = string
}

variable "extra_packages" {
  default     = ["dotnet-runtime", "tzdata"]
  description = "The additional packages to install (e.g. dotnet-runtime)."
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    },
    entrypoint = {
      command = "/usr/bin/dotnet"
    },
    cmd      = "--help",
    accounts = module.accts.block
    # copied from crane config mcr.microsoft.com/dotnet/runtime:9.0 |jq .config
    environment = {
      APP_UID                     = module.accts.uid
      ASPNETCORE_HTTP_PORTS       = 8080
      DOTNET_RUNNING_IN_CONTAINER = true
      DOTNET_VERSION              = var.dotnet_runtime_version
    }
  })
}

