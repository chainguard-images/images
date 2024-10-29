variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "versions" {
  package = "kubernetes-csi-external-snapshotter"
  source  = "../../tflib/versions"
}

locals {
  component_versions = merge([
    for c in local.components : merge([
      for k, v in local.versions : {
        "kubernetes-csi-external-${c}${v.suffix}" : {
          eol       = v.eol
          is_latest = v.is_latest
          suffix    = v.suffix
          component = c
        }
      }
    ]...)
  ]...)
  components         = toset(["snapshot-controller", "snapshot-validation-webhook", "snapshotter"])
  mangled_repository = replace(var.target_repository, "/kubernetes-csi-external-snapshotter", "/kubernetes-csi-external")
  repositories = {
    for k in local.components : k => "${local.mangled_repository}-${k}"
  }
  versions = { for k, v in module.versions.versions : k => {
    is_latest = v.is_latest
    suffix    = replace(k, "kubernetes-csi-external-snapshotter", "")
  } }
}

module "config" {
  component = each.value.component == "snapshotter" ? "csi-snapshotter" : each.value.component
  for_each  = local.component_versions
  name      = each.key
  source    = "./config"
}

module "versioned" {
  build-dev         = true
  config            = module.config[each.key].config
  eol               = each.value.eol
  for_each          = local.component_versions
  main_package      = each.key
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = local.repositories[each.value.component]
  update-repo       = each.value.is_latest
}

module "test-versioned" {
  digests  = { for c in local.components : c => module.versioned["kubernetes-csi-external-${c}${each.value.suffix}"].image_ref }
  for_each = local.versions
  source   = "./tests"
}

module "tagger" {
  depends_on = [module.test-versioned]
  for_each   = local.components
  source     = "../../tflib/tagger"
  tags = merge(
    [for v in local.versions : module.versioned["kubernetes-csi-external-${each.key}${v.suffix}"].latest_tag_map]...
  )
}

