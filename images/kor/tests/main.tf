terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "oci_exec_test" "helm-install" {
  digest = var.digest
  script = "${path.module}/script.sh"

  env {
    name  = "IMAGE_REGISTRY_REPO"
    value = data.oci_string.ref.registry_repo
  }
  env {
    name  = "IMAGE_TAG"
    value = data.oci_string.ref.pseudo_tag
  }
}
