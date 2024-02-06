terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

// Invoke a script with the test.
// $IMAGE_NAME is populated with the image name by digest.
data "oci_exec_test" "basic" {
  digest      = var.digest
  script      = "docker run --rm $IMAGE_NAME --version"
  working_dir = path.module
}
