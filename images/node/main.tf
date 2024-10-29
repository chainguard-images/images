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

module "config-next" {
  extra_packages = [
    "nodejs"
  ]
  source = "./config"
}

module "versioned" {
  build-dev        = true
  check-apk-update = true
  config           = module.config[each.key].config
  eol              = each.value.eol
  extra_dev_packages = [
    "yarn",
    "corepack",
    "pnpm",
    "build-base",
  ]
  for_each          = module.versions.versions
  main_package      = each.value.main
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = var.target_repository
  update-repo       = each.value.is_latest
}

module "next" {
  build-dev = true
  config    = module.config-next.config
  extra_dev_packages = [
    "yarn",
    "build-base",
    "npm",
    "corepack",
    "pnpm",
    "busybox",
  ]
  main_package      = ""
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = var.target_repository
  update-repo       = false
}

module "test-versioned" {
  dev-digest = module.versioned[each.key].dev_ref
  digest     = module.versioned[each.key].image_ref
  for_each   = module.versions.versions
  source     = "./tests"
}

module "test-next" {
  dev-digest = module.next.dev_ref
  digest     = module.next.image_ref
  source     = "./tests"
}

module "tagger" {
  depends_on = [module.test-versioned, module.test-next]
  source     = "../../tflib/tagger"
  tags = merge(
    {
      "next"     = module.next.image_ref,
      "next-dev" = module.next.dev_ref,
    },
    [for v in module.versioned : v.latest_tag_map]...
  )
}

