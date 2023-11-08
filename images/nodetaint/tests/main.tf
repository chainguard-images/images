terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "oci_exec_test" "helm" {
  digest = var.digest
  script = "${path.module}/02-helm.sh"

  env {
    name  = "IMAGE_REGISTRY"
    value = data.oci_string.ref.registry
  }
  env {
    name  = "IMAGE_REPOSITORY"
    value = data.oci_string.ref.repo
  }
  env {
    name  = "IMAGE_TAG"
    value = data.oci_string.ref.pseudo_tag
  }
}
