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
  script = "docker run --rm $IMAGE_NAME --version"
}

data "oci_exec_test" "healthy" {
  digest = var.digest
  script = "${path.module}/healthy.sh"
}

data "oci_exec_test" "works" {
  digest = var.digest
  script = "${path.module}/works.sh"
}
