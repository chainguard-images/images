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
  # TODO: no way to get version from rabbitmq-server?
  script = "docker run --rm --entrypoint rabbitmqctl $IMAGE_NAME version"
}

data "oci_exec_test" "perf" {
  digest = var.digest
  script = "${path.module}/02-perf.sh"
}
