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
  digest = var.digest
  script = "${path.module}/deploy.sh"
  env {
    name  = "NAMESPACE"
    value = "csi-attacher-${random_pet.suffix.id}"
  }
}
