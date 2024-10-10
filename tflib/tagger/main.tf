terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "tags" {
  // Input is tag name -> fully qualified digest ref.
  // e.g., "latest": "ttl.sh/foo/image@sha256:deadbeef"
  // Below, we split out the repo component and validate that only one repo is involved at a time.
  // We also split out the digest component and use that as the value passed to the oci_tags resource.
  description = "A map from tag name to the digest it should tag."

  validation {
    condition     = length(keys(var.tags)) > 0
    error_message = "Must pass some tags"
  }
}

variable "exclude" {
  description = "A list of tags to exclude from the tagger."
  type        = list(string)
  default     = []
}

locals { parsed = { for k, v in var.tags : k => provider::oci::parse(v) } }

locals {
  repos     = toset([for k, v in local.parsed : "${v.registry}/${v.repo}"])
  tags      = { for t, dr in var.tags : t => split("@", dr)[1] if !contains(var.exclude, t) }
  images    = distinct([for tag, ref in local.tags : ref])
  imagetags = { for image in local.images : image => compact([for tag, ref in local.tags : image == ref ? tag : null]) }
}

resource "oci_tags" "this" {
  repo = tolist(local.repos)[0]
  tags = local.tags

  lifecycle {
    precondition {
      condition     = length(local.repos) == 1
      error_message = "All of the digests passed to tagger must have the same repository name: ${join(",", local.repos)}."
    }
  }
}

output "imagetags" { value = local.imagetags }
