terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

resource "random_pet" "suffix" {}

resource "helm_release" "cert-manager" {
  name       = "cert-manager-${random_pet.suffix.id}"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  timeout    = 600

  namespace        = "cert-manager-${random_pet.suffix.id}"
  create_namespace = true
}

data "oci_exec_test" "deploy" {
  depends_on = [helm_release.cert-manager]

  digest = var.digest
  script = "${path.module}/test.sh"

  env {
    name  = "RABBITMQ_MESSAGING_TOPOLOGY_OPERATOR_IMAGE"
    value = var.digest
  }
}
