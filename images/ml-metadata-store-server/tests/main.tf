terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "ml-metadata-test" {
  digest      = var.digest
  script      = "./ml-metadata-test.sh"
  working_dir = path.module
}
