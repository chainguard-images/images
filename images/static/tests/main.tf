terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "version" {
  digest      = var.digest
  script      = "./01-multi-dockerfile-build.sh"
  working_dir = path.module
}
