terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "test" {
  digest      = var.digest
  script      = "./01-test.sh"
  working_dir = path.module
}
