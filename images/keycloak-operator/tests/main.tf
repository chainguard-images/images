terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

#No helm chart provided so sticking with kubernetes manifest
data "oci_exec_test" "manifest" {
  digest      = var.digest
  script      = "./keycloak-test.sh"
  working_dir = path.module
}
