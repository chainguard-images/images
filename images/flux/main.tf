terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

locals {
  components = toset([
    "cli",
    "helm-controller",
    "kustomize-controller",
    "notification-controller",
    "source-controller",
    "image-automation-controller",
    "image-reflector-controller",
  ])

  packages = merge(
    { for k in local.components : k => ["flux-${k}"] },
    { "cli" : ["flux", "flux-compat", "busybox"] },
  )

  // Normally the repository is named like "flux-{component}"
  // But some repositories are named differently:
  // - cli -> flux
  repositories = merge(
    { for k, v in local.components : k => "${var.target_repository}-${k}" },
    { cli = var.target_repository }
  )
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  for_each  = local.repositories
  source    = "./config"
  component = each.key
  packages  = local.packages[each.key]
}

module "latest" {
  for_each          = local.repositories
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = each.value
  config            = module.config[each.key].config
  build-dev         = true
}

module "test-latest" {
  source            = "./tests"
  digests           = { for k, v in module.latest : k => v.image_ref }
  target_repository = var.target_repository
}

resource "oci_tag" "latest" {
  for_each   = local.components
  depends_on = [module.test-latest]
  digest_ref = module.latest[each.key].image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  for_each   = local.components
  digest_ref = module.latest[each.key].dev_ref
  depends_on = [module.test-latest]
  tag        = "latest-dev"
}
