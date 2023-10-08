terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "help" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME help"
}

// TODO(#1054): Re-enable this when we can make it consistently pass.
/*
data "oci_exec_test" "build" {
  digest = var.digest
  script = "${path.module}/02-build.sh"
}
*/
