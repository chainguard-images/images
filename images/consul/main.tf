terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
    oci  = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
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

provider "apko" {
  extra_repositories = var.extra_repositories
  extra_keyring      = var.extra_keyring
  default_archs      = ["x86_64", "aarch64"]
}

module "latest" {
  source  = "chainguard-dev/apko/publisher"
  version = "0.0.4"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/latest.apko.yaml")
  extra_packages    = var.extra_packages
}

module "version-tags" {
  source  = "../../tflib/version-tags"
  package = "consul"
  config  = module.latest.config
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
}

resource "oci_tag" "version-tags" {
  depends_on = [ module.test-latest ]
  for_each   = toset(concat(["latest"], module.version-tags.tag_list))

  digest_ref = module.latest.image_ref
  tag        = "${each.key}${var.tag_suffix}"
}
