variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  versions = [
    "3.8",
    "3.9"
  ]
}

module "config" {
  for_each       = toset(local.versions)
  source         = "./configs"
  extra_packages = ["zookeeper-${each.value}", "zookeeper-bitnami-${each.value}-compat"]
}

module "latest" {
  for_each          = toset(local.versions)
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config[each.key].config
  build-dev         = true
}


module "version-tags" {
  for_each = toset(local.versions)
  source   = "../../tflib/version-tags"
  package  = "zookeeper-${each.value}"
  config   = module.latest[each.key].config
}

module "test-latest" {
  for_each = toset(local.versions)
  source   = "./tests"
  digest   = module.latest[each.key].image_ref
}

module "tagger" {
  for_each = toset(local.versions)
  source   = "../../tflib/tagger"

  depends_on = [module.test-latest]

  tags = merge(
    { for t in toset(concat(["latest"], module.version-tags[each.key].tag_list)) : t => module.latest[each.key].image_ref },
    { for t in toset(concat(["latest"], module.version-tags[each.key].tag_list)) : "${t}-dev" => module.latest[each.key].dev_ref },
  )
}
