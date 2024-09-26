terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "test-malcontent" {
  digest = var.digest
  script = "docker run --rm $IMAGE_NAME --ignore-self=false analyze /usr/bin/mal | tee /dev/stderr | grep -Ei 'RISK|DESCRIPTION|EVIDENCE'"
}
