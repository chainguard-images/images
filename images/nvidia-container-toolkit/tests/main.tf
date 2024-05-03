terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

# TODO: Convert this to imagetest_harness_container when ready
data "oci_exec_test" "runs" {
  digest = var.digest
  script = "${path.module}/01-smoke.sh"
}
