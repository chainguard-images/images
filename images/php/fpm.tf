module "versioned-fpm" {
  for_each           = toset(local.versions)
  source             = "../../tflib/publisher"
  name               = basename(path.module)
  target_repository  = var.target_repository
  config             = module.config[each.key].fpm-config
  extra_dev_packages = ["composer"]
  main_package       = each.key
}

module "test-fpm" {
  for_each  = toset(local.versions)
  source    = "./tests"
  digest    = module.versioned-fpm[each.key].image_ref
  check-fpm = true
}

module "test-fpm-dev" {
  for_each  = toset(local.versions)
  source    = "./tests"
  digest    = module.versioned-fpm[each.key].dev_ref
  check-dev = true
  check-fpm = true
}
