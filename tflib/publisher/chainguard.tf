// This config updates Chainguard repo metadata if the target repository is
// a Chainguard repo. Otherwise (e.g., ttl.sh, localhost), it does nothing.
locals {
  is_chainguard = startswith(var.target_repository, "cgr.dev/")
  parts         = split("/", var.target_repository)
  group         = local.parts[1]
  repo_name     = local.parts[length(local.parts) - 1]

  group_is_uidp = length(regexall("^[a-f0-9]{40}$", local.group)) > 0

  groups = {
    "chainguard" : "720909c9f5279097d847ad02a2f24ba8f59de36a",
  }

  readme_filepath = "images/${var.name}/README.md"

  // Parse keywords out of from metadata.yaml
  metadata_filepath = "images/${var.name}/metadata.yaml"
  metadata_public   = fileexists(local.metadata_filepath) ? yamldecode(file(local.metadata_filepath)) : null

  keywords = local.metadata_public != null ? local.metadata_public.keywords : []
  aliases  = local.metadata_public != null ? lookup(local.metadata_public, "aliases", []) : []


  // If the repo name ends with "-fips", add "fips" as a keyword (if not already present)
  keywords_updated = (endswith(local.repo_name, "-fips") && !contains(local.keywords, "fips")) ? concat(local.keywords, ["fips"]) : local.keywords

  should_run_repo_update  = var.update-repo && local.is_chainguard
  should_run_group_lookup = local.should_run_repo_update && !local.group_is_uidp && local.is_chainguard && lookup(local.groups, local.group, "") == ""
}

// If the group isn't in the list of known groups, look up its group ID.
data "chainguard_group" "group" {
  count = local.should_run_group_lookup ? 1 : 0
  name  = local.group
}

// Create or update the repo metadata.
resource "chainguard_image_repo" "repo" {
  count = local.should_run_repo_update ? 1 : 0
  // Use either the known group ID, or the one we looked up.
  parent_id = local.group_is_uidp ? local.group : (local.should_run_group_lookup ? data.chainguard_group.group[0].id : local.groups[local.group])
  readme    = file(local.readme_filepath)
  name      = local.repo_name
  // keywords in the metadata file maps to bundles in the Chainguard API
  bundles = local.keywords_updated
  aliases = local.aliases
}
