terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "tags" {
  type        = map(string)
  description = "A map from tag name to the digest it should tag."
}

variable "exclude" {
  default     = []
  type        = list(string)
  description = "The set of tags to exclude."
}

locals { parsed = { for k, v in var.tags : k => provider::oci::parse(v) } }

locals {
  repos = toset([for k, v in local.parsed : "${v.registry}/${v.repo}"])
}

resource "oci_tag" "this" {
  for_each   = { for k, v in var.tags : k => v if !contains(var.exclude, k) }
  digest_ref = each.value
  tag        = each.key

  lifecycle {
    precondition {
      condition     = length(local.repos) == 1
      error_message = "All of the digests passed to tagger must have the same repository name."
    }
  }
}
