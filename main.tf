/*
Copyright 2023 Chainguard, Inc.
SPDX-License-Identifier: Apache-2.0
*/

terraform {
  required_providers {
    apko = {
      source = "chainguard-dev/apko"
    }
    cosign = {
      source = "chainguard-dev/cosign"
    }
    oci = {
      source = "chainguard-dev/oci"
    }
  }
}

variable "apko_config_path" {
  description = "The path to the apko image config file."
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

variable "extra_repositories" {
  type        = list(string)
  default     = ["https://packages.wolfi.dev/os"]
  description = "The list of additional repositories to append to the apko configuration."
}

variable "extra_keyring" {
  type        = list(string)
  default     = ["https://packages.wolfi.dev/os/wolfi-signing.rsa.pub"]
  description = "The list of additional keyring entries to append to the apko configuration."
}

variable "extra_packages" {
  type        = list(string)
  default     = ["wolfi-baselayout"]
  description = "The list of additional packages to append to the apko configuration."
}

variable "extract_package" {
  description = "TODO."
}

provider "apko" {
  extra_repositories = var.extra_repositories
  extra_keyring      = var.extra_keyring
  default_archs      = ["x86_64", "aarch64"]
}

module "image" {
  source  = "chainguard-dev/apko/publisher"
  version = "0.0.2"

  target_repository = var.target_repository
  config            = file(var.apko_config_path)
  extra_packages    = var.extra_packages
}

output "image_ref" {
  value = module.image.image_ref
}

output "package_version" {
  value = [
    for x in module.image.config.contents.packages : regexall("(((([a-z0-9]+)(?:[.][a-z0-9]+)?)(?:[.][a-z0-9]+)?)(?:[-][a-z0-9]+)?)", trimprefix(x, "${var.extract_package}=")) if startswith(x, "${var.extract_package}=")
  ][0][0]
}
