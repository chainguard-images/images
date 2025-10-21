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

variable "update_active_tags" {
  description = "Whether to update the active tags in the Chainguard repo."
  type        = bool
  default     = false
}

variable "v_prefix" {
  description = "Create duplicate tags with 'v' prefix for version tags (e.g., '1.0' becomes both '1.0' and 'v1.0')"
  type        = bool
  default     = false
}

locals {
  # Parse input tags to convert the fully qualified digest into an object with
  # properties such as: registry, repo, digest
  parsed_input = { for k, v in var.tags : k => provider::oci::parse(v) }
}

locals {
  # Add v-prefix to any eglible tag unless it is disabled
  parsed = var.v_prefix ? merge(
    local.parsed_input,
    { for k, v in local.parsed_input : "v${k}" => v if can(regex("^[0-9]", k)) }
  ) : local.parsed_input
}

locals {
  repos     = toset([for k, v in local.parsed : "${v.registry}/${v.repo}"])
  repo      = tolist(local.repos)[0] # TODO: support more than one repo per tagger invocation?
  tags      = { for t, p in local.parsed : t => p.digest if !contains(var.exclude, t) }
  images    = distinct([for tag, ref in local.tags : ref])
  imagetags = { for image in local.images : "${local.repo}@${image}" => compact([for tag, ref in local.tags : image == ref ? tag : null]) }
}

resource "oci_tags" "this" {
  repo = local.repo
  tags = local.tags

  lifecycle {
    precondition {
      condition     = length(local.repos) == 1
      error_message = "All of the digests passed to tagger must have the same repository name: ${join(",", local.repos)}."
    }
  }
}

output "imagetags" { value = local.imagetags }
