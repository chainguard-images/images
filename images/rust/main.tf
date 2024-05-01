variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "versions" {
  source  = "../../tflib/versions"
  package = "rust"
}

module "config" {
  for_each = module.versions.versions
  source   = "./config"
}

module "versioned" {
  for_each          = module.versions.versions
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config.config
  build-dev         = true
  main_package      = each.value.main
  update-repo       = each.value.is_latest
  # Note that rustup / rust versions do not match up.
  extra_dev_packages = ["rustup"]
}

module "test-versioned" {
  for_each = module.versions.versions
  source   = "./tests"
  digest   = module.versioned[each.key].image_ref
}

module "test-versioned-dev" {
  for_each  = module.versions.versions
  source    = "./tests"
  digest    = module.versioned[each.key].dev_ref
  check-dev = true
}

module "tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-versioned, module.test-versioned-dev]
  tags = merge(
    [for v in module.versioned : v.latest_tag_map]...
  )
}

