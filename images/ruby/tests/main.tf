terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "usage" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME"
}

data "oci_exec_test" "irb-version" {
  digest = var.digest
  script = "docker run --rm --entrypoint irb $IMAGE_NAME -v"
}

data "oci_exec_test" "hello-world" {
  digest = var.digest
  script = "${path.module}/02-hello-world.sh"
}

data "oci_exec_test" "base-image" {
  digest = var.digest
  script = "${path.module}/03-base-image.sh"
}
