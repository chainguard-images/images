module "latest-wolfi" {
  for_each          = local.accounts
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = file("${path.module}/configs/latest.wolfi.${each.key}.apko.yaml")
  build-dev         = true
}

module "version-tags-wolfi" {
  for_each = local.accounts
  source   = "../../tflib/version-tags"
  package  = "git"
  config   = module.latest-wolfi[each.key].config
}

module "test-latest-wolfi" {
  for_each = local.accounts
  source   = "./tests"
  digest   = module.latest-wolfi[each.key].image_ref
}

module "test-latest-wolfi-dev" {
  for_each  = local.accounts
  source    = "./tests"
  digest    = module.latest-wolfi[each.key].dev_ref
  check-dev = true
}
