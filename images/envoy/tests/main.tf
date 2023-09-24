terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME envoy --version | grep '^envoy  version:'"
}

resource "random_pet" "suffix" {}

data "oci_exec_test" "serving-static-rules" {
  digest = var.digest
  script = "${path.module}/static.sh"

  env {
    name  = "NAMESPACE"
    value = "envoy-static-${random_pet.suffix.id}"
  }
}
