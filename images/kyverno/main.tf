terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

locals {
  components = toset(["admission", "background", "cleanup", "cli", "init", "reports"])

  // Normally the package is named like "kyverno-{component}-controller"
  // But some packages are named differently:
  // - admission -> kyverno
  // - cli -> kyverno-cli
  // - init -> kyverno-init-container
  packages = merge({
    for k, v in local.components : k => "kyverno-${k}-controller"
    }, {
    "admission" : "kyverno",
    "cli" : "kyverno-cli",
    "init" : "kyverno-init-container",
  })

  // Normally the repository is named like "kyverno-{component}-controller"
  // But some repositories are named differently:
  // - admission -> kyverno
  // - cli -> kyverno-cli
  // - init -> kyvernopre
  repositories = merge({
    for k, v in local.components : k => "${var.target_repository}-${k}-controller"
    }, {
    "admission" : var.target_repository,
    "cli" : "${var.target_repository}-cli",
    "init" : "${var.target_repository}pre",
  })
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  for_each     = local.components
  source       = "./config"
  component    = each.key
  main_package = local.packages[each.key]
}

module "latest" {
  for_each = local.components
  source   = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = local.repositories[each.key]
  config            = module.config[each.key].config
}

module "test-latest" {
  source = "./tests"

  digests = { for k, v in module.latest : k => v.image_ref }
}

resource "oci_tag" "latest" {
  for_each   = local.components
  depends_on = [module.test-latest]
  digest_ref = module.latest[each.key].image_ref
  tag        = "latest"
}
