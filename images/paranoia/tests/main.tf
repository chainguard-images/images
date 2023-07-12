terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --help 2>&1 | grep 'Paranoia is a command-line tool'"
}

data "oci_exec_test" "list-certs" {
  digest = var.digest
  script = "${path.module}/02-list-certs.sh"
}
