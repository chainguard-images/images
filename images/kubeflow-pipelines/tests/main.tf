terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    api-server            = string
    cache-server          = string
    metadata-writer       = string
    persistenceagent      = string
    scheduledworkflow     = string
    viewer-crd-controller = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}
