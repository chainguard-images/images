
terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install"
  // TODO: Add any other packages here you want to conditionally include,
  // or update this default to [] if this isn't a version stream image.
  default = [
    "mongodb-7.3",
  ]
}

variable "extra_repositories" {
  description = "The additional repositores to install from (e.g. extras)."
  default     = ["https://packages.cgr.dev/extras"]
}

variable "extra_keyring" {
  description = "The additional keys to use (e.g. extras)."
  default     = ["https://packages.cgr.dev/extras/chainguard-extras.rsa.pub"]
}

data "apko_config" "this" {
  config_contents    = file("${path.module}/template.apko.yaml")
  extra_packages     = var.extra_packages
  extra_repositories = var.extra_repositories
  extra_keyring      = var.extra_keyring
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
