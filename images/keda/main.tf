locals {
  components = toset([
    "controller",
    "adapter",
    "webhooks",
  ])

  packages = merge(
    { for k in local.components : k => k },
    {
      "controller" = "keda"
      "adapter"    = "keda-adapter"
      "webhooks"   = "keda-admission-webhooks"
    },
  )

  repositories = merge(
    { for k in local.components : k => k },
    {
      "controller" = var.target_repository
      "adapter"    = "${var.target_repository}-adapter"
      "webhooks"   = "${var.target_repository}-admission-webhooks"
    },
  )
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest" {
  for_each          = local.repositories
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = each.value
  config            = file("${path.module}/configs/latest.${each.key}.apko.yaml")
  build-dev         = true
}

module "version-tags" {
  for_each = local.packages
  source   = "../../tflib/version-tags"
  package  = each.value
  config   = module.latest[each.key].config
}

module "test-latest" {
  source  = "./tests"
  digests = { for k, v in module.latest : k => v.image_ref }
}

module "tagger" {
  for_each = local.components
  source   = "../../tflib/tagger"

  depends_on = [module.test-latest]

  tags = merge(
    { for t in toset(concat(["latest"], module.version-tags[each.key].tag_list)) : t => module.latest[each.key].image_ref },
    { for t in toset(concat(["latest"], module.version-tags[each.key].tag_list)) : "${t}-dev" => module.latest[each.key].dev_ref },
  )
}
