terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

variable "extra_repositories" {
  type    = list(string)
  default = []
}

variable "extra_keyring" {
  type    = list(string)
  default = []
}

variable "extra_packages" {
  type    = list(string)
  default = []
}

variable "archs" {
  type    = list(string)
  default = []
}

provider "apko" {
  extra_repositories = ["https://dl-cdn.alpinelinux.org/alpine/edge/main"]
  extra_packages     = ["alpine-baselayout-data", "alpine-release", "ca-certificates-bundle"]
  default_archs      = var.archs # defaults to all
  default_annotations = {
    "org.opencontainers.image.authors" : "Chainguard Team https://www.chainguard.dev/", // TODO: remove this when everything is migrated to TF annotations
  }
}

module "busybox" {
  source            = "./busybox"
  target_repository = "${var.target_repository}/busybox"
}

module "git" {
  source            = "./git"
  target_repository = "${var.target_repository}/git"
}

module "static" {
  source            = "./static"
  target_repository = "${var.target_repository}/static"
}
