terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "dev-digest" {
  description = "The image dev digest to run tests over."
}

data "oci_exec_test" "dockerfile" {
  digest = var.digest
  env = [{
    name  = "DEV_IMAGE_NAME"
    value = var.dev-digest
  }]
  script      = "./01-dockerfile.sh"
  working_dir = path.module
}

