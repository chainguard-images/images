terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "tags" {
  description = "A map from tag name to the digest it should tag."
}

variable "exclude" {
  default     = []
  description = "The set of tags to exclude."
}

resource "oci_tag" "this" {
  for_each   = { for k, v in var.tags : k => v if !contains(var.exclude, k) }
  digest_ref = each.value
  tag        = each.key
}
