locals {
  extra_packages = [
    "fluent-bit", "fluent-bit-compat", "fluent-watcher-compat"
  ]
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "versions" {
  package = "fluent-watcher"
  source  = "../../tflib/versions"
}

module "config" {
  for_each       = module.versions.versions
  source         = "../fluent-operator/config"
  extra_packages = concat([each.key], local.extra_packages)
}

module "versioned" {
  for_each          = module.versions.versions
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config[each.key].config
  build-dev         = true
  main_package      = each.value.main
  update-repo       = each.value.is_latest
}

module "test-versioned" {
  for_each = module.versions.versions
  source   = "../fluent-operator/tests"
  digest   = module.versioned[each.key].image_ref
}

module "tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-versioned]
  tags       = merge([for v in module.versioned : v.latest_tag_map]...)
}
