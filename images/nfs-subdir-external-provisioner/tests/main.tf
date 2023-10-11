terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

data "oci_exec_test" "runs" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME 2>&1 | grep 'NFS_SERVER not set'"
}
