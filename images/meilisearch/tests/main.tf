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
  script = "${path.module}/01-version.sh"
}

data "oci_exec_test" "index" {
  digest = var.digest
  script = "${path.module}/02-index.sh"
}
