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

  // Normally the package is named like "flux-{component}"
  // But some packages are named differently:
  // - cli -> flux
  packages = merge(
    { for k, v in local.components : k => "flux-${k}" },
    { cli = "flux" }
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
    { "latest" : module.latest[each.key].image_ref },
    { "latest-dev" : module.latest[each.key].dev_ref },
    { for t in module.version-tags[each.key].tag_list : t => module.latest[each.key].image_ref },
    { for t in module.version-tags[each.key].tag_list : "${t}-dev" => module.latest[each.key].dev_ref },

    # This will also tag the image with :v1, :v1.2, :v1.2.3, :v1.2.3-r4, for compatibility with upstream Helm charts.
    # TODO(jason): Do this for all images, not just flux, and potentially only for `:v1.2.3` and `:v1.2.3-r4` (not `:v1` or `:v1.2`).
    { for t in module.version-tags[each.key].tag_list : "v${t}" => module.latest[each.key].image_ref },
    { for t in module.version-tags[each.key].tag_list : "v${t}-dev" => module.latest[each.key].dev_ref },
  )
}
