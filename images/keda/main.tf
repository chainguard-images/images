locals {
  // List of all components
  components = toset([
    "keda",
    "keda-adapter",
    "keda-admission-webhooks",
  ])

  // Cross product of versions and components
  component_versions = merge([
    for component in local.components : merge([
      for key, version_metadata in module.versions.versions : {
        join("-", compact([key, substr(component, 5, 100)])) : {

          is_latest = version_metadata.is_latest
          component = component
          main      = join("-", compact([key, substr(component, 5, 100)]))
        }
      }
    ]...)
  ]...)
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  for_each = local.component_versions
  source   = "./config"
  name     = each.value.component
}

module "versions" {
  source  = "../../tflib/versions"
  package = "keda"
}

module "versioned" {
  for_each          = local.component_versions
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = "${var.target_repository}/${each.value.component}"
  config            = module.config[each.key].config
  build-dev         = true

  main_package = each.value.main
  update-repo  = each.value.is_latest
}

module "test" {
  source  = "./tests"
  digests = { for k, v in module.versioned : k => v.image_ref }
}

module "tagger" {
  for_each = local.component_versions
  source   = "../../tflib/tagger"

  depends_on = [module.test]

  tags = module.versioned[each.key].latest_tag_map
}
