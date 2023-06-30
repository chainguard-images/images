terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "oci_exec_test" "e2e" {
  digest      = var.digest
  script      = "./e2e.sh"
  working_dir = path.module

  env {
    name  = "IMAGE_TAG"
    value = data.oci_string.ref.pseudo_tag
  }

  env {
    name  = "IMAGE_REGISTRY_REPO"
    value = data.oci_string.ref.registry_repo
  }
}
