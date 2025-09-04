terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

data "apko_config" "package-info" {
  config_contents = jsonencode({
    contents = {
      packages = var.extra_packages
    }
  })
}

locals {
  full_package_version          = split("=", local.package_conf)[1]
  package_conf                  = [for p in data.apko_config.package-info.config.contents.packages : p if startswith(p, "dotnet")][0]
  package_version_without_epoch = split("-", local.full_package_version)[0]
}

module "accts" {
  source = "../../../../tflib/accts"
}

variable "dotnet_runtime_version" {
  description = "The .NET runtime version."
  type        = string
}

variable "extra_packages" {
  default     = ["dotnet-sdk", "tzdata"]
  description = "The additional packages to install (e.g. dotnet-sdk)."
}

output "config" {
  value = jsonencode({
    contents = {
      packages = var.extra_packages
    },
    entrypoint = {},
    cmd        = "/bin/sh -l",
    accounts   = module.accts.block
    environment = {
      # copied from crane config mcr.microsoft.com/dotnet/sdk:9.0 |jq .config
      APP_UID                            = module.accts.uid
      ASPNETCORE_HTTP_PORTS              = 8080
      DOTNET_RUNNING_IN_CONTAINER        = true,
      DOTNET_VERSION                     = var.dotnet_runtime_version
      ASPNET_VERSION                     = var.dotnet_runtime_version
      DOTNET_GENERATE_ASPNET_CERTIFICATE = false,
      DOTNET_NOLOGO                      = true,
      DOTNET_SDK_VERSION                 = local.package_version_without_epoch,
      DOTNET_USE_POLLING_FILE_WATCHER    = true,
      NUGET_XMLDOC_MODE                  = "skip",
    }
  })
}

