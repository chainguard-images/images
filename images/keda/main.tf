locals {
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
  components = toset([
    "keda",
    "keda-metrics-apiserver",
    "keda-admission-webhooks",
  ])
  versions = [
    for _, version_metadata in module.versions.versions : lookup(version_metadata, "version", "")
  ]
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "versions" {
  package = "keda"
  source  = "../../tflib/versions"
}

module "config" {
  for_each = local.component_versions
  name     = each.value.component
  package  = each.value.main
  source   = "./config"
}

module "versioned" {
  build-dev         = true
  config            = module.config[each.key].config
  for_each          = local.component_versions
  main_package      = each.value.main
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = replace(var.target_repository, "/keda", "/${each.value.component}")
  update-repo       = each.value.is_latest
}

module "test" {
  digests  = { for component in local.components : component => module.versioned["${component}${each.value}"].image_ref }
  for_each = toset(local.versions)
  name     = "${basename(path.module)}${each.value}"
  source   = "./tests"
}

module "tagger" {
  depends_on = [module.test]
  for_each   = local.components
  source     = "../../tflib/tagger"
  tags = merge(
    [for version in local.versions : module.versioned["${each.value}${version}"].latest_tag_map]...
  )
}

