// This config updates Chainguard repo metadata if the target repository is
// a Chainguard repo. Otherwise (e.g., ttl.sh, localhost), it does nothing.
locals {
  is_chainguard = startswith(var.target_repository, "cgr.dev/")
  parts         = split("/", var.target_repository)
  group         = local.parts[1]
  repo_name     = local.parts[length(local.parts) - 1]

  groups = {
    "chainguard" : "720909c9f5279097d847ad02a2f24ba8f59de36a",
  }
}

// If the group isn't in the list of known groups, look up its group ID.
data "chainguard_group" "group" {
  count = local.is_chainguard && lookup(local.groups, local.group, "") == "" ? 1 : 0
  name  = local.group
}

// Create or update the repo metadata.
resource "chainguard_image_repo" "repo" {
  count = local.is_chainguard ? 1 : 0
  // Use either the known group ID, or the one we looked up.
  parent_id = lookup(local.groups, local.group, "") == "" ? data.chainguard_group.group[0].id : local.groups[local.group]
  readme    = file("images/${var.name}/README.md")
  name      = local.repo_name
  // keywords in the metadata file maps to bundles in the Chainguard API
  bundles = yamldecode(file("images/${var.name}/metadata.yaml")).keywords
}
