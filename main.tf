terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

# This variable gets populated by ./tfgen based on the inputs in `images.auto.tfvars`
variable "images" {
  type = map(string)
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
  extra_repositories = concat(["https://packages.wolfi.dev/os"], var.extra_repositories)
  extra_keyring      = concat(["https://packages.wolfi.dev/os/wolfi-signing.rsa.pub"], var.extra_keyring)
  extra_packages     = concat(["wolfi-baselayout"], var.extra_packages)
  default_archs      = length(var.archs) == 0 ? ["x86_64", "aarch64"] : var.archs
  default_annotations = {
    "org.opencontainers.image.authors" : "Chainguard Team https://www.chainguard.dev/", // TODO: remove this when everything is migrated to TF annotations
  }
}

provider "apko" {
  alias = "alpine"

  extra_repositories = ["https://dl-cdn.alpinelinux.org/alpine/edge/main"]
  # These packages match chainguard-images/static
  extra_packages = ["alpine-baselayout-data", "alpine-release", "ca-certificates-bundle"]
  default_archs  = length(var.archs) == 0 ? ["386", "amd64", "arm/v6", "arm/v7", "arm64", "ppc64le", "s390x"] : var.archs // All arches *except* riscv64
  default_annotations = {
    "org.opencontainers.image.authors" : "Chainguard Team https://www.chainguard.dev/", // TODO: remove this when everything is migrated to TF annotations
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# Set to something valid to avoid errors during targetted runs
variable "newrelic_license_key" { default = "foo" }
