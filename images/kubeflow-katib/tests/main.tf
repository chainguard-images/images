terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    suggestion-goptuna    = string
    file-metricscollector = string
    controller            = string
    db-manager            = string
  })
}

data "oci_string" "ref" {
  for_each = var.digests
  input    = each.value
}
