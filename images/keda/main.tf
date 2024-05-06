locals {
  # List of all components
  components = toset([
    "keda",
    "keda-adapter",
    "keda-admission-webhooks",
  ])

  # List of versions.
  #
  # When version metadata is not available this will look like
  # "versions" = [""]
  #
  # When version metadata is available this will look like
  # "versions" = ["2.13", "2.14"]
  #
  # Order matters here, we want the latest version to be the last element in
  # the list so it's tagged with latest.
  versions = [
    for _, version_metadata in module.versions.versions : lookup(version_metadata, "version", "")
  ]

  # Cross product of versions and components
  #
  # When version metadata is not available this will look like
  # "component_versions" = {
  #   "keda" = {
  #     "component" = "keda"
  #     "is_latest" = true
  #     "main"      = "keda"
  #   }
  #   "keda-adapter" = {
  #     "component" = "keda-adapter"
  #     "is_latest" = true
  #     "main"      = "keda-adapter"
  #   }
  #   ...
  # }
  #
  # When version metadata is not available this will look like
  # "component_versions" = {
  #   "keda2.14" = {
  #     "component" = "keda"
  #     "is_latest" = true
  #     "main"      = "keda-2.14"
  #   }
  #   "keda-adapter2.14"            = {
  #     "component" = "keda-adapter"
  #     "is_latest" = true
  #     "main"      = "keda-2.14-adapter"
  #   }
  #   ...
  # }
  component_versions = merge([
    for component in local.components : merge([
      for key, version_metadata in module.versions.versions : {

        # This sets the key to `$component` when version data does not exist and
        # `$component$version` when version data exists. We just smash the two
        # together to make it easier to access in subsequent modules.
        format("%s%s", component, lookup(version_metadata, "version", "")) : {
          is_latest = version_metadata.is_latest
          component = component

          # Strips off `keda` or `keda-` from the components and joins with the
          # version_metadata key which will be `keda` when version data does not
          # exist and `keda-$version` when version data exists
          main = join("-", compact([key, trimprefix(replace(component, "keda", ""), "-")]))
        }
      }
    ]...)
  ]...)
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

# Versions module plugs into to the version metadata for the top-level package
module "versions" {
  source  = "../../tflib/versions"
  package = basename(path.module)
}

# Need a config for every version of every component
module "config" {
  for_each = local.component_versions
  source   = "./config"
  name     = each.value.component
  package  = each.value.main
}

# Need a publisher invocation for every version of every component
module "versioned" {
  for_each          = local.component_versions
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = replace(var.target_repository, "/keda", "/${each.value.component}")
  config            = module.config[each.key].config
  build-dev         = true

  main_package = each.value.main
  update-repo  = each.value.is_latest
}

# Tests need to be grouped by version. We want to test all components of
# the same version at the same time.
module "test" {
  for_each = toset(local.versions)
  source   = "./tests"

  digests = { for component in local.components : component => module.versioned["${component}${each.value}"].image_ref }
  name    = "${basename(path.module)}${each.value}"
}

# Tagger should be grouped by components. We want to tag multiple versions of
# the same component so we iterate over the versions list for each component
module "tagger" {
  for_each = local.components
  source   = "../../tflib/tagger"

  depends_on = [module.test]

  tags = merge(
    [for version in local.versions : module.versioned["${each.value}${version}"].latest_tag_map]...
  )
}
