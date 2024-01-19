terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "check-dev" {
  default     = false
  description = "Whether to check for dev extensions"
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --version"
}

data "oci_exec_test" "dev" {
  count  = var.check-dev ? 1 : 0
  digest = var.digest

  script = "docker run --rm --entrypoint rustup $IMAGE_NAME --version"

}
