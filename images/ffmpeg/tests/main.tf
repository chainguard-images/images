terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "help" {
  digest      = var.digest
  script      = "./01-help.sh"
  working_dir = path.module
}

data "oci_exec_test" "convert" {
  digest      = var.digest
  script      = "./02-convert.sh"
  working_dir = path.module
}
