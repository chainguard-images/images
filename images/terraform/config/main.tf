terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install (e.g. terraform)."
  default     = []
}

variable "extra_repositories" {
  description = "The additional repositores to install from (e.g. extras)."
  default     = []
}

variable "extra_keyring" {
  description = "The additional keys to use (e.g. extras)."
  default     = []
}

locals { base_config = yamldecode(file("${path.module}/template.apko.yaml")) }

data "apko_config" "this" {
  config_contents = yamlencode(merge(
    local.base_config,
    {
      // Allow injecting extra repositories and keyrings.
      contents = {
        repositories = var.extra_repositories
        keyring      = var.extra_keyring
        packages     = local.base_config.contents.packages
      }
    },
  ))
  extra_packages = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
