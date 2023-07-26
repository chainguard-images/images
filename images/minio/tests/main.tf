terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    minio        = string
    minio-client = string
  })
}

data "oci_exec_test" "version" {
  for_each = var.digests
  digest   = each.value

  script = "docker run --rm $IMAGE_NAME --version"
}
