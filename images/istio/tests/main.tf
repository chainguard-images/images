terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digest to run tests over."
  type = object({
    proxy = string
  })
}

data "oci_exec_test" "version" {
  digest = var.digests.proxy
  script = "docker run --rm $IMAGE_NAME --version"
}
