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
  package_conf                  = [for p in data.apko_config.package-info.config.contents.packages : p if startswith(p, "dotnet")][0]
  full_package_version          = split("=", local.package_conf)[1]
  package_version_without_epoch = split("-", local.full_package_version)[0] // This extracts the version without the epoch
}

module "accts" {
  source = "../../../../tflib/accts"
}

variable "extra_packages" {
  default     = ["dotnet-sdk"]
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
      DOTNET_VERSION                     = local.package_version_without_epoch,
      ASPNET_VERSION                     = local.package_version_without_epoch
      DOTNET_GENERATE_ASPNET_CERTIFICATE = false,
      DOTNET_NOLOGO                      = true,
      DOTNET_SDK_VERSION                 = local.package_version_without_epoch,
      DOTNET_USE_POLLING_FILE_WATCHER    = true,
      NUGET_XMLDOC_MODE                  = "skip",
    }
  })
}

