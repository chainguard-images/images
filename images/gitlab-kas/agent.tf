locals {
  // List of all components
  components = toset(["gitlab-agent"])

  // Version objects with version suffix added
  versions = { for k, v in module.versions.versions : k => {
    is_latest = v.is_latest
    suffix    = replace(k, "gitlab-kas", "")
  } }

  // Cross product of versions and components
  component_versions = merge([
    for c in local.components : merge([
      for k, v in local.versions : {
        "${c}${v.suffix}" : {
          is_latest = v.is_latest
          suffix    = v.suffix
          component = c
          # main      = c
          main = "${c}${v.suffix}"
        }
      }
    ]...)
  ]...)

  base_repo = replace(var.target_repository, "/gitlab-kas", "/gitlab-agent")
}

module "agent_config" {
  for_each       = local.component_versions
  source         = "./configs/agent"
  suffix         = each.value.suffix
  extra_packages = []
}

module "agent_versioned" {
  for_each = local.component_versions
  source   = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = local.base_repo
  config            = module.agent_config[each.key].config
  build-dev         = true
  main_package      = each.value.main
  update-repo       = each.value.is_latest
}

module "agent_tagger" {
  for_each   = local.components
  source     = "../../tflib/tagger"
  depends_on = [module.test]
  tags = merge(
    [for v in local.versions : module.agent_versioned["${each.key}${v.suffix}"].latest_tag_map]...
  )
}
