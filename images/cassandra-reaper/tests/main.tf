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

resource "random_pet" "suffix" {}

data "oci_exec_test" "runs" {
  digest      = var.digest
  script      = "./smoke-test.sh"
  working_dir = path.module

  env {
    name  = "IMAGE_REGISTRY"
    value = data.oci_string.ref.registry
  }
  env {
    name  = "IMAGE_REPOSITORY"
    value = split("/", data.oci_string.ref.repo)[0]
  }
  env {
    name  = "IMAGE_TAG"
    value = data.oci_string.ref.pseudo_tag
  }
}
