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

data "oci_exec_test" "welcome-page" {
  digest = var.digest
  script = "${path.module}/02-welcome-page.sh"
}

data "oci_exec_test" "shutdown" {
  digest = var.digest
  script = "${path.module}/03-shutdown.sh"
}
