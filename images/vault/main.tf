terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

locals {
  components = toset([
    "vault",
    "vault-k8s",
  ])

  packages = {
    vault     = "vault-1.14",
    vault-k8s = "vault-k8s",
  }

  repositories = {
    vault     = var.target_repository,
    vault-k8s = "${var.target_repository}-k8s",
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest" {
  for_each = local.repositories
  source   = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = each.value
  config            = file("${path.module}/configs/latest.${each.key}.apko.yaml")
}

module "dev" { source = "../../tflib/dev-subvariant" }

module "latest-dev" {
  for_each = local.repositories
  source   = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = each.value
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.latest[each.key].config)
  extra_packages = module.dev.extra_packages
}

module "version-tags" {
  for_each = local.components
  source   = "../../tflib/version-tags"

  package = local.packages[each.key]
  config  = module.latest[each.key].config
}

module "test-latest" {
  source  = "./tests"
  digests = { for c in local.components : c => module.latest[c].image_ref }
}

module "tagger" {
  for_each = local.components
  source   = "../../tflib/tagger"

  depends_on = [
    module.test-latest,
  ]

  tags = merge(
    { for t in toset(concat(["latest"], module.version-tags[each.key].tag_list)) : t => module.latest[each.key].image_ref },
    { for t in toset(concat(["latest"], module.version-tags[each.key].tag_list)) : "${t}-dev" => module.latest-dev[each.key].image_ref },
  )
}
