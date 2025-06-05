variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "versions" {
  package = "rust"
  source  = "../../tflib/versions"
}

module "config" {
  extra_packages = [each.key, "build-base", "busybox", "cargo-auditable", "rust-audit-info"]
  for_each       = module.versions.versions
  source         = "./config"
}

module "versioned" {
  build-dev          = true
  config             = module.config[each.key].config
  eol                = each.value.eol
  extra_dev_packages = ["rustup"]
  for_each           = module.versions.versions
  main_package       = each.value.main
  name               = basename(path.module)
  source             = "../../tflib/publisher"
  target_repository  = var.target_repository
  update-repo        = each.value.is_latest
}

module "test-versioned" {
  digest            = module.versioned[each.key].image_ref
  for_each          = module.versions.versions
  image_version     = each.key
  source            = "./tests"
  target_repository = var.target_repository
}

module "test-versioned-dev" {
  check-dev         = true
  digest            = module.versioned[each.key].dev_ref
  for_each          = module.versions.versions
  image_version     = each.key
  source            = "./tests"
  target_repository = var.target_repository
}

module "tagger" {
  depends_on = [module.test-versioned, module.test-versioned-dev]
  source     = "../../tflib/tagger"
  tags = merge(
    [for v in module.versioned : v.latest_tag_map]...
  )
}

