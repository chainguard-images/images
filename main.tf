terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
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

provider "apko" {
  extra_repositories = var.extra_repositories
  extra_keyring      = var.extra_keyring
  extra_packages     = var.extra_packages
  default_archs      = ["x86_64", "aarch64"]
}

module "bazel" {
  source = "./images/bazel"
  target_repository = "${var.target_repository}/bazel"
}

module "clang" {
  source = "./images/clang"
  target_repository = "${var.target_repository}/clang"
}

module "consul" {
  source = "./images/consul"
  target_repository = "${var.target_repository}/consul"
}

module "crane" {
  source = "./images/crane"
  target_repository = "${var.target_repository}/crane"
}

module "ko" {
  source = "./images/ko"
  target_repository = "${var.target_repository}/ko"
}

module "terraform" {
  source = "./images/terraform"
  target_repository = "${var.target_repository}/terraform"
}