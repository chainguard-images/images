terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "test-bincapz" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --ignore-self=false /usr/bin/bincapz | tee /dev/stderr | grep -Ei 'RISK|DESCRIPTION|EVIDENCE'"
}
