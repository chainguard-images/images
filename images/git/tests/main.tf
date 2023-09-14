terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "check-dev" {
  default = false
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}

data "oci_exec_test" "submodule" {
  count = var.check-dev ? 1 : 0

  digest = var.digest
  script = "docker run --rm $IMAGE_NAME submodule -h"
}

data "oci_exec_test" "clone" {
  digest = var.digest
  script = "${path.module}/repo-clone.sh"
}
