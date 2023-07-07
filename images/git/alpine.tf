module "latest-alpine" {
  providers = {
    apko = apko.alpine
  }
  for_each = local.accounts
  source   = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/latest.alpine.${each.key}.apko.yaml")
  # Override the module's default wolfi packages that conflict with alpine
  extra_packages = []
}

module "latest-alpine-dev" {
  providers = {
    apko = apko.alpine
  }
  for_each = local.accounts
  source   = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/latest.alpine.${each.key}.apko.yaml")
  # Override the module's default wolfi packages that conflict with alpine
  extra_packages = module.dev.extra_packages
}

module "version-tags-alpine" {
  for_each = local.accounts
  source   = "../../tflib/version-tags"

  package = "git"
  config  = module.latest-alpine[each.key].config
}

module "test-latest-alpine" {
  for_each = local.accounts
  source   = "./tests"

  digest = module.latest-alpine[each.key].image_ref
}

module "test-latest-alpine-dev" {
  for_each = local.accounts
  source   = "./tests"

  digest    = module.latest-alpine-dev[each.key].image_ref
  check-dev = true
}
