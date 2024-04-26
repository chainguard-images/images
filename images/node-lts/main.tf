terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "versions" {
  source  = "../../tflib/versions"
  package = "nodejs-lts"
}

module "config" {
  for_each = module.versions.versions
  source   = "../node/config"
  extra_packages = [
    each.key,
    "busybox",
    "npm"
  ]
}

module "config-next" {
  source = "../node/config"
  extra_packages = [
    "nodejs"
  ]
}

module "versioned" {
  for_each          = module.versions.versions
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config[each.key].config
  build-dev         = true
  main_package      = each.value.main
  update-repo       = each.value.is_latest
  extra_dev_packages = [
    "yarn",
    "build-base",
    "python-3.11",
  ]
}

module "next" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config-next.config
  build-dev         = true
  update-repo       = false
  main_package      = ""
  extra_dev_packages = [
    "yarn",
    "build-base",
    "python-3.11",
    "npm",
    "busybox",
  ]
}

module "test-versioned" {
  for_each = module.versions.versions
  source   = "../node/tests"
  digest   = module.versioned[each.key].image_ref
}

module "test-next" {
  source = "../node/tests"
  digest = module.next.image_ref
}

module "tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-versioned, module.test-next]
  tags = merge(
    {
      "next"     = module.next.image_ref,
      "next-dev" = module.next.dev_ref,
    },
    [for v in module.versioned : v.latest_tag_map]...
  )
}
