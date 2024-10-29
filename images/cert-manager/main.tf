variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "versions" {
  package = "cert-manager"
  source  = "../../tflib/versions"
}

locals {
  component_versions = merge([
    for c in local.components : merge([
      for k, v in local.versions : {
        "${c}${v.suffix}" : {
          eol       = v.eol
          is_latest = v.is_latest
          suffix    = v.suffix
          component = c
          main      = "cert-manager${v.suffix}-${c}"
        }
      }
    ]...)
  ]...)
  components = toset(["acmesolver", "controller", "cainjector", "webhook"])
  versions = { for k, v in module.versions.versions : k => {
    is_latest = v.is_latest
    suffix    = replace(k, "cert-manager", "")
  } }
}

module "config" {
  for_each = local.component_versions
  name     = each.value.component
  source   = "./config/cert-manager"
  suffix   = each.value.suffix
}

module "versioned" {
  build-dev = true
  config    = module.config[each.key].config
  eol       = each.value.eol
  extra_dev_packages = [
    each.value.suffix == "" ? "cmctl" : (
      # If the version is greater than 1.14, use the independently versioned cmctl package
      tonumber(regex("^-(\\d+\\.\\d+)$", coalesce(each.value.suffix, "-1.99"))[0]) > 1.14 ? "cmctl" : "cmctl${each.value.suffix}"
    )
  ]
  for_each          = local.component_versions
  main_package      = each.value.main
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = "${var.target_repository}-${each.value.component}"
  update-repo       = each.value.is_latest
}

module "test" {
  digests  = { for c in local.components : c => module.versioned["${c}${each.value.suffix}"].image_ref }
  for_each = local.versions
  source   = "./tests"
}

module "tagger" {
  depends_on = [module.test]
  for_each   = local.components
  source     = "../../tflib/tagger"
  tags = merge(
    [for v in local.versions : module.versioned["${each.key}${v.suffix}"].latest_tag_map]...
  )
}

