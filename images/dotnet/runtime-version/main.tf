// We use apko to parse the .NET SDK version
terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "dotnet_major_version" {
  description = "The major version of .NET."
}

// Retrieves package info for .NET host
data "apko_config" "pkgconf" {
  config_contents = jsonencode({
    contents = {
      packages = ["dotnet-${var.dotnet_major_version}"]
    }
  })
}

// Retrieve .NET stream from .NET host
locals {
  // This parses the .NET host package in the dummy config needed to fetch the .NET stream
  dotnet_pkgconf          = [for p in data.apko_config.pkgconf.config.contents.packages : p if startswith(p, "dotnet-")][0]
  dotnet_sdk_full_version = split("=", local.dotnet_pkgconf)[1]                          // This extracts the full .NET SDK version, including the epoch
  dotnet_sdk_version      = split("-", local.dotnet_sdk_full_version)[0]                 // This extracts the .NET SDK
  dotnet_stream           = join(".", slice(split(".", local.dotnet_sdk_version), 0, 2)) // Parse .NET stream
}

// This runs an external script that we use to retrieve the version of
// the .NET runtime. We take what the script returns (it will be in JSON
// format) and append it our tag map below. We fetch the runtime version
// with curl by curling the release manifest for the specified .NET
// stream in the .NET core repository.
data "external" "dotnet-version" {
  program = ["bash", "${path.module}/parse-runtime-version.sh"]
  query = {
    dotnet_sdk_version = local.dotnet_sdk_version
    dotnet_stream      = local.dotnet_stream
  }
}

// Output the .NET runtime version
output "dotnet_runtime_version" {
  value = data.external.dotnet-version.result.dotnet_runtime_version
}

// And the .NET stream
output "dotnet_stream" {
  value = local.dotnet_stream
}
