terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

locals {
  components = toset(["core", "config-reloader", "operator"])

  // Normally the package is named like "prometheus-{component}"
  // But some packages are named differently:
  // - core -> prometheus
  packages = merge({
    for k, v in local.components : k => "prometheus-${k}"
    }, {
    "core" : "prometheus",
  })

  // Normally the repository is named like "prometheus-{component}"
  // But some repositories are named differently:
  // - core -> prometheus
  repositories = merge({
    for k, v in local.components : k => "${var.target_repository}-${k}"
    }, {
    "core" : var.target_repository,
  })
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest" {
  for_each = local.components
  source   = "../../tflib/publisher"

  target_repository = local.repositories[each.key]
  config            = file("${path.module}/configs/latest.${each.key}.apko.yaml")
}

module "dev" {
  source = "../../tflib/dev-subvariant"
}

module "latest-dev" {
  for_each = local.components
  source   = "../../tflib/publisher"

  target_repository = local.repositories[each.key]
  config            = jsonencode(module.latest[each.key].config)
  extra_packages    = module.dev.extra_packages
}

module "version-tags" {
  for_each = local.components
  source   = "../../tflib/version-tags"

  package = local.packages[each.key]
  config  = module.latest[each.key].config
}

module "test-latest" {
  source = "./tests"

  digests = { for k, v in module.latest : k => v.image_ref }
}

module "tagger" {
  for_each = local.components
  source   = "../../tflib/tagger"

  # We rely on latest to test things for -dev because the Helm stuff doesn't
  # cleanly parallelize given how it installs into the cluster.
  depends_on = [module.test-latest]

  tags = merge(
    { for t in toset(concat(["latest"], module.version-tags[each.key].tag_list)) : t => module.latest[each.key].image_ref },
    { for t in toset(concat(["latest"], module.version-tags[each.key].tag_list)) : "${t}-dev" => module.latest-dev[each.key].image_ref },
  )
}
