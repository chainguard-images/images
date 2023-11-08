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
// TODO: Update or remove this test as appropriate.
data "oci_exec_test" "manifest" {
  digest      = var.digest
  script      = "./runs.sh"
  working_dir = path.module
}
