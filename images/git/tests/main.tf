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
  script = "${path.module}/version.sh"
}

data "oci_exec_test" "clone" {
  digest = var.digest
  script = "${path.module}/repo-clone.sh"
}
