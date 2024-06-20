locals {
  versions = ["fluent-bit", "fluent-bit-compat", "fluent-watcher-compat", "fluent-watcher"]
  }

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  source         = "../fluent-operator/config"
  extra_packages = concat([each.key], each.value)

}

module "versioned" {
  for_each = local.versions
  source   = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config[each.key].config
  build-dev         = true
  main_package      = each.key
}

module "test-latest" {
  for_each = local.versions
  source   = "../fluent-operator/tests"

  digest = module.versioned[each.key].image_ref
}

module "tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-latest]
  tags       = merge([for v in local.versions: module.versioned[v].latest_tag_map]...)
}

