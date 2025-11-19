locals {
  default_latest_version = "10"
}

terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "dotnet_major_version" {
  description = "The major version of .NET."
}

data "apko_config" "pkgconf" {
  config_contents = jsonencode({
    contents = {
      packages = [
        // If no major version provided, use default/latest version
        var.dotnet_major_version == "" ? "dotnet-${local.default_latest_version}" : "dotnet-${var.dotnet_major_version}",
      ]
    }
  })
}

locals {
  dotnet_epoch            = split("-", local.dotnet_sdk_full_version)[1]
  dotnet_pkgconf          = [for p in data.apko_config.pkgconf.config.contents.packages : p if startswith(p, "dotnet-")][0]
  dotnet_sdk_full_version = split("=", local.dotnet_pkgconf)[1]
  dotnet_sdk_version      = split("-", local.dotnet_sdk_full_version)[0]
  dotnet_stream           = join(".", slice(split(".", local.dotnet_sdk_version), 0, 2))
}

data "external" "dotnet-version" {
  program = ["bash", "${path.module}/parse-runtime-version.sh"]
  query = {
    dotnet_sdk_version = local.dotnet_sdk_version
    dotnet_stream      = local.dotnet_stream
  }
}

output "dotnet_runtime_version" {
  value = data.external.dotnet-version.result.dotnet_runtime_version
}

output "dotnet_stream" {
  value = local.dotnet_stream
}

output "dotnet_epoch" {
  value = local.dotnet_epoch
}

