terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "helm" {
  digest      = var.digest
  script      = "./helm.sh"
  working_dir = path.module

  # Split the digest ref into repository and digest. The helm chart expects a
  # tag, but it just appends it to the repository again, so we just specify a
  # dummy tag and the digest to test.
  env {
    name  = "IMAGE_TAG"
    value = "unused@${element(split("@", var.digest), 1)}"
  }
}
