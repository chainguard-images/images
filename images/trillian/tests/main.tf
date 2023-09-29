terraform {
  required_providers {
    oci  = { source = "chainguard-dev/oci" }
    helm = { source = "hashicorp/helm" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    logserver = string
    logsigner = string
  })
}


data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}


data "oci_exec_test" "test" {
  digest = data.oci_string.ref["logsigner"].id
  script = "${path.module}/test.sh"

  env {
    name  = "TRILLIAN_LOG_SIGNER"
    value = data.oci_string.ref["logsigner"].id
  }

  env {
    name  = "TRILLIAN_LOG_SERVER"
    value = data.oci_string.ref["logserver"].id
  }
}
