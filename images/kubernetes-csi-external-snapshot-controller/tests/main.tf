terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "oci_exec_test" "help" {
  digest = var.digest
  script = "${path.module}/01-help.sh"
}

data "oci_exec_test" "runs" {
  digest = var.digest
  script = "${path.module}/02-runs.sh"

  env {
    name  = "IMAGE_TAG"
    value = data.oci_string.ref.pseudo_tag
  }
}
