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

variable "test_dir" {
  description = "The directory from which to run tests."
}

variable "test_cmd" {
  description = "The command to run to invoke tests."
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

variable "target_tag" {
  description = "The target tag for this image."
}

variable "tag_suffix" {
  description = "The suffix to the tag for this image."
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
  version = "0.0.4"

  target_repository = var.target_repository
  config            = file(var.apko_config_path)
  extra_packages    = var.extra_packages
}

data "oci_exec_test" "this" {
  digest = module.image.image_ref
  script = <<EOF
    export IMAGE_TAG_SUFFIX="${var.tag_suffix}"
    cd "${path.module}/${var.test_dir}"
    ${var.test_cmd}
  EOF
}

module "version-tags" {
  source  = "./tflib/version-tags"
  package = var.extract_package
  config  = module.image.config
}

resource "oci_tag" "this" {
  depends_on = [ data.oci_exec_test.this ]
  for_each   = toset(concat(["latest"], module.version-tags.tag_list))

  digest_ref = module.image.image_ref
  tag        = "${each.key}${var.tag_suffix}"
}
