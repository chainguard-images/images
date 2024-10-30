terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "warn_on_failure" {
  description = "Whether to fail or warn if the test fails. Used only for EOL images."
  default     = false
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}

data "oci_exec_test" "compile" {
  digest = var.digest
  script = "${path.module}/02-compile.sh"
}
