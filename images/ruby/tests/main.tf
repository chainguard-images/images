terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "usage" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME"
}

data "oci_exec_test" "irb-version" {
  digest = var.digest
  script = "docker run --rm --entrypoint irb $IMAGE_NAME -v"
}
