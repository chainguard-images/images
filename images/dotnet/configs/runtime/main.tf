terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

# TODO: Create a dotnet-runtime virtual that we can track.

variable "extra_packages" {
  description = "The additional packages to install (e.g. dotnet-7-runtime)."
  default     = ["dotnet-7-runtime"]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/template.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
