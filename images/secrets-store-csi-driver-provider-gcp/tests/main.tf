terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

// This just tests that the image can run. See the gcp-tests module for
// more comprehensive tests that require a GCP project.
data "oci_exec_test" "help" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --help"
}
