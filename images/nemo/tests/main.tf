terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "nemo-docker-run" {
  digest      = var.digest
  script      = "./nemo_installation.sh"
  working_dir = path.module
}

resource "random_pet" "suffix" {}
