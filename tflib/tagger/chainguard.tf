// This config updates Chainguard repo metadata if the target repository is
// a Chainguard repo. Otherwise (e.g., ttl.sh, localhost), it does nothing.
//
// When testing this locally, make sure you set the target_repository to a
// URL with the UIDP rather than the name, i.e. cgr.dev/2d727bdf1a624e9ed5606a2ff4bb3f7c2f83ee06
// for chainguard-eng. Also note to run "make enable-active-tag-update".
//
// NOTE: If you find yourself changing the group stuff below, make sure to keep this aligned
// with publisher/chainguard.tf.
locals {
  parts     = split("/", local.repo)
  group     = local.parts[1]
  repo_name = local.parts[length(local.parts) - 1]

  is_chainguard_prod    = startswith(local.repo, "cgr.dev/")
  is_chainguard_staging = startswith(local.repo, "chainreg.biz/")

  // Attempt to determine if the group looks like a valid UIDP
  group_is_uidp = length(regexall("^[a-f0-9]{40}$", local.group)) > 0

  // These can be found here: https://github.com/chainguard-dev/mono/blob/main/env/enforce.dev/registry-config.yaml
  groups_prod = {
    "chainguard-private" = "ce2d1984a010471142503340d670612d63ffb9f6"
    "custom-images"      = "8d00810b0a029559e52399855031958ef48be6c8"
  }

  // These can be found here: https://github.com/chainguard-dev/mono/blob/main/env/chainops.dev/registry-config.yaml
  groups_staging = {
    "chainguard-private" = "e2709b80f26b43cf0b8a30d75e8a19815560d206"
    "custom-images"      = "8e32b609b7021a0c931a4d97041ddd611e20dc54"
  }
}

// Look up the repo so that we can upsert the active tags.
// We're using the singular source since the repo has to exist at this point.
// If not, that's a bug we should look out for.
data "chainguard_image_repo" "repo" {
  count     = var.update_active_tags ? 1 : 0
  parent_id = local.group_is_uidp ? local.group : (local.is_chainguard_prod ? local.groups_prod[local.group] : local.groups_staging[local.group])
  name      = local.repo_name
}

// Update the repo metadata.
module "repo" {
  source     = "../../tflib/repo"
  count      = var.update_active_tags ? 1 : 0
  depends_on = [oci_tags.this] # Only update if the tags got successfully pushed.

  parent_id   = local.group_is_uidp ? local.group : (local.is_chainguard_prod ? local.groups_prod[local.group] : local.groups_staging[local.group])
  name        = data.chainguard_image_repo.repo[0].name
  readme      = data.chainguard_image_repo.repo[0].items[0].readme
  bundles     = data.chainguard_image_repo.repo[0].items[0].bundles
  tier        = data.chainguard_image_repo.repo[0].items[0].tier
  aliases     = data.chainguard_image_repo.repo[0].items[0].aliases
  active_tags = keys(local.tags)
}
