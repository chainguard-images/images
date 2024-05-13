variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "versions" {
  package = "cert-manager"
  source  = "../../tflib/versions"
}

locals {
  // List of all components
  components = toset(["acmesolver", "controller", "cainjector", "cmctl", "webhook"])

  // Version objects with version suffix added
  versions = { for k, v in module.versions.versions : k => {
    is_latest = v.is_latest
    suffix    = replace(k, "cert-manager", "")
  } }

  // Cross product of versions and components
  component_versions = merge([
    for c in local.components : merge([
      for k, v in local.versions : {
        "${c}${v.suffix}" : {
          is_latest = v.is_latest
          suffix    = v.suffix
          component = c

          # Package name is "cert-manager-${component}" except for cmctl
          main = c == "cmctl" ? "cmctl${v.suffix}" : "cert-manager${v.suffix}-${c}"
        }
      }
    ]...)
  ]...)
}

module "config" {
  for_each = local.component_versions
  source   = "./config"
  name     = each.value.component
  suffix   = each.value.suffix
}

module "versioned" {
  for_each           = local.component_versions
  source             = "../../tflib/publisher"
  name               = basename(path.module)
  target_repository  = "${var.target_repository}-${each.value.component}"
  config             = module.config[each.key].config
  extra_dev_packages = ["cmctl${each.value.suffix}"]
  build-dev          = true
  main_package       = each.value.main
  update-repo        = each.value.is_latest
}

module "test" {
  source   = "./tests"
  for_each = local.versions
  digests  = { for c in local.components : c => module.versioned["${c}${each.value.suffix}"].image_ref }
}

module "tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test]
  for_each   = local.components
  tags = merge(
    [for v in local.versions : module.versioned["${each.key}${v.suffix}"].latest_tag_map]...
  )
}
