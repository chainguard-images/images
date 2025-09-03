// This config updates Chainguard repo metadata if the target repository is
// a Chainguard repo. Otherwise (e.g., ttl.sh, localhost), it does nothing.
//
// NOTE: If you find yourself changing the group stuff below, make sure to keep this aligned
// with publisher/chainguard.tf.
locals {
  parts     = split("/", local.repo)
  group     = local.parts[1]
  repo_name = local.parts[length(local.parts) - 1]

  is_chainguard = startswith(local.repo, "cgr.dev/")

  // Attempt to determine if the group looks like a valid UIDP
  group_is_uidp = length(regexall("^[a-f0-9]{40}$", local.group)) > 0

  groups = {
    "chainguard" : "720909c9f5279097d847ad02a2f24ba8f59de36a",
  }
}

// Look up the repo so that we can upsert the active tags.
// We're using the singular source since the repo has to exist at this point.
// If not, that's a bug we should look out for.
data "chainguard_image_repo" "repo" {
  count     = var.update_active_tags ? 1 : 0
  parent_id = local.group_is_uidp ? local.group : local.groups[local.group]
  name      = local.repo_name
}

// Update the repo metadata.
module "repo" {
  source     = "../../tflib/repo"
  count      = var.update_active_tags ? 1 : 0
  depends_on = [oci_tags.this] # Only update if the tags got successfully pushed.

  parent_id   = local.group_is_uidp ? local.group : local.groups[local.group]
  name        = data.chainguard_image_repo.repo[0].name
  readme      = data.chainguard_image_repo.repo[0].items[0].readme
  bundles     = data.chainguard_image_repo.repo[0].items[0].bundles
  tier        = data.chainguard_image_repo.repo[0].items[0].tier
  aliases     = data.chainguard_image_repo.repo[0].items[0].aliases
  active_tags = keys(local.tags)
}
