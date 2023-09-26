terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "docker-compose" {
  digest      = var.digest
  script      = "./docker-compose.sh"
  working_dir = path.module
}
