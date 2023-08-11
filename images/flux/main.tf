terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
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

  // Normally the package is named like "flux-{component}"
  // But some packages are named differently:
  // - cli -> flux
  packages = merge(
    { for k, v in local.components : k => "flux-${k}" },
    {
      cli = "flux",
    }
  )

  // Normally the repository is named like "flux-{component}"
  // But some repositories are named differently:
  // - cli -> flux
  repositories = merge(
    { for k, v in local.components : k => "${var.target_repository}-${k}" },
    {
      cli = var.target_repository,
    }
  )
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "dev" {
  source = "../../tflib/dev-subvariant"
}

module "latest" {
  for_each = local.repositories
  source   = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = each.value
  config            = file("${path.module}/configs/latest.${each.key}.apko.yaml")
}

module "latest-dev" {
  for_each = local.repositories
  source   = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = each.value
  config            = jsonencode(module.latest[each.key].config)
  extra_packages    = module.dev.extra_packages
}

module "version-tags" {
  for_each = local.packages
  source   = "../../tflib/version-tags"

  package = each.value
  config  = module.latest[each.key].config
}

module "test-latest" {
  source = "./tests"

  digests = { for k, v in module.latest : k => v.image_ref }
}

module "tagger" {
  for_each = local.components
  source   = "../../tflib/tagger"

  depends_on = [module.test-latest]

  tags = merge(
    { for t in toset(concat(["latest"], module.version-tags[each.key].tag_list)) : t => module.latest[each.key].image_ref },
    { for t in toset(concat(["latest"], module.version-tags[each.key].tag_list)) : "${t}-dev" => module.latest-dev[each.key].image_ref },
  )
}

module "output" {
  for_each = local.components
  source   = "../../tflib/image-outputer"
  images = {
    latest     = module.latest[each.key]
    latest-dev = module.latest-dev[each.key]
  }
  tagger = module.tagger[each.key]
}

output "images" {
  value = { for k, v in module.output : k => v.images }
}
