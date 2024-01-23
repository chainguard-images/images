terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
  type        = string
}

data "oci_string" "ref" { input = var.digest }

data "oci_exec_test" "test" {
  digest = var.digest
  script = "${path.module}/full-test.sh"

  env {
    name  = "APP"
    value = "jupyter-web-app"
  }
  env {
    name  = "IMAGE_REGISTRY_REPO"
    value = data.oci_string.ref.registry_repo
  }
  env {
    name  = "IMAGE_TAG"
    value = data.oci_string.ref.pseudo_tag
  }
}
