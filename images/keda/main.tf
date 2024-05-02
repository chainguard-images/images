locals {
  components = toset([
    "keda",
    "keda-adapter",
    "keda-admission-webhooks",
  ])

  repositories = merge(
    { for k in local.components : k => k },
    {
      "keda"                    = var.target_repository
      "keda-adapter"            = "${var.target_repository}-adapter"
      "keda-admission-webhooks" = "${var.target_repository}-admission-webhooks"
    },
  )
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  for_each = local.components
  source   = "./config"
  name     = each.value
}

module "versions" {
  for_each = local.components
  source   = "../../tflib/versions"
  package  = each.value
}

module "latest" {
  for_each          = local.components
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = local.repositories[each.value]
  config            = module.config[each.value].config
  build-dev         = true

  main_package = module.versions[each.value].versions[each.value].main
  update-repo  = module.versions[each.value].versions[each.value].is_latest
}

module "test-latest" {
  source  = "./tests"
  digests = { for k, v in module.latest : k => v.image_ref }
}

module "tagger" {
  for_each = local.components
  source   = "../../tflib/tagger"

  depends_on = [module.test-latest]

  tags = {
    "latest"     = module.latest[each.value].image_ref
    "latest-dev" = module.latest[each.value].dev_ref
  }
}
