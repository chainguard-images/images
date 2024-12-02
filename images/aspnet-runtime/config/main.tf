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
  package_conf                  = [for p in data.apko_config.package-info.config.contents.packages : p if startswith(p, "aspnet")][0]
  full_package_version          = split("=", local.package_conf)[1]
  package_version_without_epoch = split("-", local.full_package_version)[0] // This extracts the version without the epoch
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
      DOTNET_VERSION              = local.package_version_without_epoch,
      ASPNET_VERSION              = local.package_version_without_epoch,
    }
  })
}
