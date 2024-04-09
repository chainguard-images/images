terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

resource "random_pet" "suffix" {}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "version" {
  digest = var.digest
  # TODO: no way to get version from rabbitmq-server?
  script = "docker run --rm --entrypoint rabbitmqctl $IMAGE_NAME version"
}

# TODO: Convert to imagetest_harness_container when ready
data "oci_exec_test" "perf" {
  digest = var.digest
  script = "${path.module}/02-perf.sh"
  env {
    name  = "RANDOM_NAME"
    value = random_pet.suffix.id
  }
}
