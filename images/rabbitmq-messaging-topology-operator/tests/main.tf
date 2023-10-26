terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

resource "random_pet" "suffix" {}

data "oci_exec_test" "deploy" {
  #depends_on = [helm_release.cert-manager]

  digest = var.digest
  script = "${path.module}/test.sh"

  env {
    name  = "RABBITMQ_MESSAGING_TOPOLOGY_OPERATOR_IMAGE"
    value = var.digest
  }
}
