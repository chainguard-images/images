terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "runs" {
  digest = var.digest
  script = "${path.module}/01-runs.sh"
}

data "oci_exec_test" "install" {
  digest          = var.digest
  script          = "${path.module}/02-k8s-install-all-languages.sh"
  timeout_seconds = 10 * 60
}
