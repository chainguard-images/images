terraform {
  required_providers {
    apko      = { source = "chainguard-dev/apko" }
    imagetest = { source = "chainguard-dev/imagetest" }
    cosign    = { source = "chainguard-dev/cosign" }
  }

  # We don't take advantage of terraform.tfstate, so we don't need to save state anywhere.
  #
  # The default "local" backend has pathological performance as state gets large, see:
  # https://github.com/opentofu/opentofu/issues/578
  #
  # Consider removing this if that's ever fixed and/or if we want to use tfstate.
  backend "inmem" {}
}

variable "tests_skip_all" {
  type    = bool
  default = false
}

variable "tests_include_by_label" {
  type    = map(string)
  default = {}
}

variable "tests_exclude_by_label" {
  type    = map(string)
  default = {}
}

provider "imagetest" {
  repo = "${var.target_repository}/imagetest"

  test_execution = {
    skip_all_tests   = var.tests_skip_all
    include_by_label = var.tests_include_by_label
    exclude_by_label = var.tests_exclude_by_label
  }
}

variable "target_repository" {
  type        = string
  description = "The root repo into which the images should be published (e.g., cgr.dev/chainguard). Individual images will be published within this root repo."
}

variable "test_repository" {
  description = "The docker repo root to use for sourcing test images."
  default     = "cgr.dev/chainguard"
}

variable "extra_repositories" {
  type        = list(string)
  default     = []
  description = "Extra repositories to look for when finding packages."
}

variable "extra_keyring" {
  type        = list(string)
  default     = []
  description = "Extra keyrings to use when finding packages."
}

variable "extra_packages" {
  type        = list(string)
  default     = []
  description = "Extra packages to install in all images."
}

variable "archs" {
  type        = list(string)
  default     = ["x86_64", "aarch64"]
  description = "The architectures to build for. If empty, defaults to x86_64 and aarch64."
}

provider "apko" {
  extra_repositories = concat(["https://packages.wolfi.dev/os"], var.extra_repositories)
  extra_keyring      = concat(["https://packages.wolfi.dev/os/wolfi-signing.rsa.pub"], var.extra_keyring)
  extra_packages     = concat(["wolfi-baselayout"], var.extra_packages)
  default_archs      = ["x86_64", "aarch64"]
}

variable "newrelic_license_key" { default = "foo" } # set something valid to avoid targetted local runs

module "busybox" {
  source            = "./images/busybox"
  target_repository = "${var.target_repository}/busybox"
}

module "git" {
  source            = "./images/git"
  target_repository = "${var.target_repository}/git"
}

module "maven" {
  source            = "./images/maven"
  target_repository = "${var.target_repository}/maven"
}

module "static" {
  source            = "./images/static"
  target_repository = "${var.target_repository}/static"
}

provider "cosign" {
  default_attestation_entry_type = "dsse"
}
