terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digest" {
  description = "The image digests to run tests over."
}

data "oci_string" "ref" {
  input = var.digest
}

data "oci_exec_test" "runs" {
  digest      = var.digest
  script      = "./smoke_test.sh"
  working_dir = path.module

  env {
    name  = "IMAGE_REGISTRY_REPO"
    value = data.oci_string.ref.registry_repo
  }
  env {
    name  = "IMAGE_TAG"
    value = data.oci_string.ref.pseudo_tag
  }
}
