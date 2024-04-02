terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "git-help" {
  digest = var.digest
  script = "docker run --rm -t $IMAGE_NAME help"
}

data "oci_exec_test" "gitsign-help" {
  digest = var.digest
  script = "docker run --entrypoint gitsign --rm -t $IMAGE_NAME help"
}
