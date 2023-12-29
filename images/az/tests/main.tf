terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

// Invoke a few things with the image.
data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}

data "oci_exec_test" "help" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --help"
}

data "oci_exec_test" "sql-help" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME sql --help"
}
