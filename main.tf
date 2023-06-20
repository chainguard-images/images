terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
    oci  = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

provider "apko" {
  extra_repositories = ["https://packages.wolfi.dev/os"]
  extra_keyring      = ["https://packages.wolfi.dev/os/wolfi-signing.rsa.pub"]
  extra_packages     = ["wolfi-baselayout"]
  default_archs      = ["x86_64", "aarch64"]
}

module "bazel" {
  source            = "./images/bazel"
  target_repository = "${var.target_repository}/bazel"
}

module "clang" {
  source            = "./images/clang"
  target_repository = "${var.target_repository}/clang"
}

module "consul" {
  source            = "./images/consul"
  target_repository = "${var.target_repository}/consul"
}

module "crane" {
  source            = "./images/crane"
  target_repository = "${var.target_repository}/crane"
}

module "ffmpeg" {
  source            = "./images/ffmpeg"
  target_repository = "${var.target_repository}/ffmpeg"
}

module "ko" {
  source            = "./images/ko"
  target_repository = "${var.target_repository}/ko"
}

module "mdbook" {
  source            = "./images/mdbook"
  target_repository = "${var.target_repository}/mdbook"
}

module "terraform" {
  source            = "./images/terraform"
  target_repository = "${var.target_repository}/terraform"
}
