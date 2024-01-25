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
    name  = "IMAGE_REGISTRY"
    value = data.oci_string.ref.registry
  }
  env {
    name  = "IMAGE_REPOSITORY"
    value = split("/", data.oci_string.ref.repo)[0]
  }

  env {
    name  = "NAME"
    value = split("/", data.oci_string.ref.repo)[1]
  }

  env {
    name  = "IMAGE_TAG"
    value = data.oci_string.ref.pseudo_tag
  }
}

