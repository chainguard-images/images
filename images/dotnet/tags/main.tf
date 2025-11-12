variable "dotnet_major_version" {
  description = "The major version of .NET."
}

variable "dotnet_runtime_version" {
  description = "The runtime version of .NET."
}

variable "dotnet_stream" {
  description = "The .NET stream."
}

variable "dotnet_epoch" {
  description = "The .NET package epoch"
}

variable "is_latest" {
  description = "Whether or not the version is latest."
}

variable "image_ref" {
  description = "Image ref."
}

variable "dev_ref" {
  description = "Dev ref."
}

locals {
  latest_tag_map = var.is_latest == false ? local.tag_map : merge(
    local.tag_map,
    {
      "latest"     = var.image_ref
      "latest-dev" = var.dev_ref
    }
  )
  tag_map = var.dotnet_major_version == "" ? {} : {
    // First, let's append tags that contain the .NET runtime version
    "${var.dotnet_runtime_version}"     = var.image_ref
    "${var.dotnet_runtime_version}-dev" = var.dev_ref

    // There aren't multiple minor versions of the .NET runtime actively
    // supported so we can safely tag with the stream as well
    "${var.dotnet_stream}"     = var.image_ref
    "${var.dotnet_stream}-dev" = var.dev_ref

    // And do the same for the major version of .NET
    "${var.dotnet_major_version}"     = var.image_ref
    "${var.dotnet_major_version}-dev" = var.dev_ref

    // And add the full package version with epoch
    "${var.dotnet_runtime_version}-${var.dotnet_epoch}"     = var.image_ref
    "${var.dotnet_runtime_version}-${var.dotnet_epoch}-dev" = var.dev_ref
  }
}

output "tag_map" {
  value = local.tag_map
}

output "latest_tag_map" {
  value = local.latest_tag_map
}

