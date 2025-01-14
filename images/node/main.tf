terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "versions" {
  package = "nodejs"
  source  = "../../tflib/versions"
}

module "config" {
  extra_packages = [
    each.key,
    "busybox",
    "npm"
  ]
  for_each = module.versions.versions
  source   = "./config"
}

module "config-slim" {
  extra_packages = [
    each.key,
  ]
  for_each = module.versions.versions
  source   = "./config"
}

module "versioned" {
  build-dev        = true
  check-apk-update = true
  config           = module.config[each.key].config
  eol              = each.value.eol
  extra_dev_packages = [
    "build-base",
    "corepack",
    "pnpm",
    "yarn",
  ]
  for_each          = module.versions.versions
  main_package      = each.value.main
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = var.target_repository
  update-repo       = each.value.is_latest
}

module "versioned-slim" {
  build-dev         = false
  config            = module.config-slim[each.key].config
  eol               = each.value.eol
  for_each          = module.versions.versions
  main_package      = each.value.main
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = var.target_repository
  update-repo       = each.value.is_latest
}

module "test-versioned" {
  dev-digest = module.versioned[each.key].dev_ref
  digest     = module.versioned[each.key].image_ref
  for_each   = module.versions.versions
  source     = "./tests"
}

module "test-versioned-slim" {
  dev-digest = module.versioned[each.key].dev_ref
  digest     = module.versioned-slim[each.key].image_ref
  for_each   = module.versions.versions
  source     = "./tests"
}

module "tagger" {
  depends_on = [module.test-versioned, module.test-versioned-slim]
  source     = "../../tflib/tagger"
  tags = merge(
    {
      "latest-slim" = module.versioned-slim[module.versions.ordered_keys[0]].image_ref,
    },
    [for k in module.versions.ordered_keys : module.versioned[k].latest_tag_map]...
  )
}

