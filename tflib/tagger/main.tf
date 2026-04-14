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
  default     = true
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

  expected_tags_file = "${path.root}/.expected_tags"
  has_expected_tags  = fileexists(local.expected_tags_file)
  expected_tags_raw  = local.has_expected_tags ? jsondecode(file(local.expected_tags_file)) : {}

  # The expected tags file contains entries for all components in the module,
  # but each tagger invocation only handles one. Filter by repo name suffix.
  expected_tags_repo = { for k, v in local.expected_tags_raw : k => v if endswith(split("@", k)[0], "/${local.repo_name}") }
  expected_tags      = { for k, v in local.expected_tags_repo : split("@", k)[1] => toset(v) }
  actual_tags        = { for k, v in local.imagetags : split("@", k)[1] => toset(v) }
}

resource "oci_tags" "this" {
  repo = local.repo
  tags = local.tags

  lifecycle {
    precondition {
      condition     = length(local.repos) == 1
      error_message = "All of the digests passed to tagger must have the same repository name: ${join(",", local.repos)}."
    }

    precondition {
      condition     = !local.has_expected_tags || local.expected_tags == local.actual_tags
      error_message = <<-EOT
        Tag map does not match expected set from test job.
        Expected (from ${local.expected_tags_file}): ${jsonencode(local.expected_tags)}
        Actual (from tagger inputs): ${jsonencode(local.actual_tags)}
      EOT
    }
  }
}

output "imagetags" { value = local.imagetags }
