terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "${path.module}/01-version.sh"
}

data "oci_exec_test" "intercept" {
  digest = var.digest
  script = "${path.module}/02-intercept.sh"
}

data "oci_exec_test" "signals" {
  digest = var.digest
  script = "${path.module}/03-signals.sh"
}
