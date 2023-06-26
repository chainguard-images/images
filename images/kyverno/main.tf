terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

locals {
  c2p = {
    init                  = "kyverno-init-container"
    controller            = "kyverno"
    background-controller = "kyverno-background-controller"
    cleanup-controller    = "kyverno-cleanup-controller"
    reports-controller    = "kyverno-reports-controller"
  }
  components = toset(keys(local.c2p))
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest" {
  for_each = local.components
  source   = "../../tflib/publisher"

  target_repository = "${var.target_repository}-${each.key}"
  config            = file("${path.module}/configs/latest.${each.key}.apko.yaml")
}

module "dev" {
  for_each = local.components
  source   = "../../tflib/dev-subvariant"
}

module "latest-dev" {
  for_each = local.components
  source   = "../../tflib/publisher"

  target_repository = "${var.target_repository}-${each.key}"
  config            = jsonencode(module.latest[each.key].config)
  extra_packages    = module.dev[each.key].extra_packages
}

module "version-tags" {
  for_each = local.components
  source   = "../../tflib/version-tags"

  package = local.c2p[each.key]
  config  = module.latest[each.key].config
}

module "test-latest" {
  source = "./tests"

  digests = { for k, v in module.latest : k => v.image_ref }
}

# module "test-latest-dev" {
#   source = "./tests"
#
#   digests   = { for k, v in module.latest : k => v.image_ref }
#   skip_crds = true
# }

module "tagger" {
  for_each = local.components
  source   = "../../tflib/tagger"

  depends_on = [
    module.test-latest,
    # module.test-latest-dev,
  ]

  tags = merge(
    { for t in toset(concat(["latest"], module.version-tags[each.key].tag_list)) : t => module.latest[each.key].image_ref },
    { for t in toset(concat(["latest"], module.version-tags[each.key].tag_list)) : "${t}-dev" => module.latest-dev[each.key].image_ref },
  )
}
