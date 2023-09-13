terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

// Invoke the image's version command.
// TODO: Update or remove this test as appropriate.
data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME version"
}

// Invoke a script with the test.
// TODO: Update or remove this test as appropriate.
data "oci_exec_test" "manifest" {
  digest = var.digest
  script = "${path.module}/EXAMPLE_TEST.sh"
}

