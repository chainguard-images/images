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

variable "extract_package" {
  description = "TODO."
}

provider "apko" {
  extra_repositories = []
  extra_keyring      = []
  default_archs      = []
  extra_packages     = []
}

module "image" {
  source  = "chainguard-dev/apko/publisher"

  target_repository = var.target_repository
  config = file(var.apko_config_path)
}

output "image_ref" {
  value = module.image.image_ref
}

output "package_version" {
  value = [
    for x in module.image.config.contents.packages : regexall("(((([a-z0-9]+)(?:[.][a-z0-9]+)?)(?:[.][a-z0-9]+)?)(?:[-][a-z0-9]+)?)", trimprefix(x, "${var.extract_package}=")) if startswith(x, "${var.extract_package}=")
  ][0][0]
}
