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
  default     = ["dotnet-runtime"]
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
      DOTNET_RUNNING_IN_CONTAINER = true,
      DOTNET_VERSION              = local.package_version_without_epoch,
    }
  })
}

