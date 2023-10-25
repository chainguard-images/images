terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "deploy" {
  digest = var.digest
  script = "${path.module}/test.sh"

  env {
    name  = "RABBITMQ_CLUSTER_OPERATOR_IMAGE"
    value = var.digest
  }
}
