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

variable "check-dev" {
  default     = false
  description = "Whether to check for dev extensions"
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}

data "oci_exec_test" "version" {
  for_each = var.digests
  digest   = each.value

  script = "docker run --rm $IMAGE_NAME --version"
}

data "oci_exec_test" "test" {
  count  = var.check-dev ? 1 : 0
  digest = var.digests["minio"]
  script = "${path.module}/test.sh"
  env {
    name  = "MINIO_IMAGE"
    value = var.digests["minio"]
  }

  env {
    name  = "MC_IMAGE"
    value = var.digests["minio-client"]
  }
}
