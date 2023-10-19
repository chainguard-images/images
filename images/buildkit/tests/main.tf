terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "script" {
  description = "path of the script to run, relative to this folder."
}

data "oci_exec_test" "build" {
  digest = var.digest
  script = var.script
}
