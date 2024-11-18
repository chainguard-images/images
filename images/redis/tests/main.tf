terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "test_activedefrag" {
  default = true
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}

data "oci_exec_test" "server" {
  digest = var.digest
  script = "${path.module}/02-server.sh"
}

data "oci_exec_test" "activedefrag" {
  count = var.test_activedefrag ? 1 : 0

  digest = var.digest
  script = "${path.module}/03-server-activedefrag.sh"
}
