terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

resource "random_pet" "suffix" {}

data "oci_string" "ref" { input = var.digest }

data "oci_exec_test" "medusa-install" {

  digest = var.digest
  script = "${path.module}/medusa-install.sh"

  env {
    name  = "NAMESPACE"
    value = "k8s-medusa-${random_pet.suffix.id}"
  }

  env {
    name  = "CERT"
    value = "cert-manager-${random_pet.suffix.id}"
  }

  env {
    name  = "REPOSITORY"
    value = split("/", data.oci_string.ref.repo)[0]
  }

  env {
    name  = "NAME"
    value = split("/", data.oci_string.ref.repo)[1]
  }
}

