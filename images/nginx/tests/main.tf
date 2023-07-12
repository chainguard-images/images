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
  script = "docker run --rm --entrypoint /usr/sbin/nginx $IMAGE_NAME -v"
}

data "oci_exec_test" "welcome-page" {
  digest = var.digest
  script = "${path.module}/02-welcome-page.sh"
}

data "oci_exec_test" "shutdown" {
  digest = var.digest
  script = "${path.module}/03-shutdown.sh"
}
