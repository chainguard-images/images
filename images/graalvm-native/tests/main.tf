terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "runs" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME /sbin/ldconfig --help"
}
