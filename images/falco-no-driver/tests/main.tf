terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "oci_exec_test" "helm-install" {
  digest = var.digest
  script = "${path.module}/falco-helm-install.sh"

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
