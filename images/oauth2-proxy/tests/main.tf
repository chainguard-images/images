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
  script = "docker run --rm $IMAGE_NAME --version | grep -i '^oauth2-proxy'"
}

data "oci_exec_test" "intercept" {
  digest = var.digest
  script = "${path.module}/02-intercept.sh"
}

data "oci_exec_test" "signals" {
  digest = var.digest
  script = "${path.module}/03-signals.sh"
}
