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
  script = "docker run --rm $IMAGE_NAME version"
}

data "oci_exec_test" "manifest" {
  digest = var.digest
  script = "${path.module}/02-manifest.sh"
}

data "oci_exec_test" "digest" {
  digest = var.digest
  script = "${path.module}/03-digest.sh"
}

data "oci_exec_test" "ls" {
  digest = var.digest
  script = "${path.module}/04-ls.sh"
}

data "oci_exec_test" "config" {
  digest = var.digest
  script = "${path.module}/05-config.sh"
}