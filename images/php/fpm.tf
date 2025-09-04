module "fpm-config" {
  for_each = toset(local.versions)
  source   = "./config/fpm"

  extra_packages = [
    "${each.key}-curl",
    "${each.key}-openssl",
    "${each.key}-iconv",
    "${each.key}-mbstring",
    "${each.key}-mysqlnd",
    "${each.key}-pdo",
    "${each.key}-pdo_sqlite",
    "${each.key}-pdo_mysql",
    "${each.key}-sodium",
    "${each.key}-phar",
    "${each.key}",
    "${each.key}-fpm",
  ]
}

module "versioned-fpm" {
  for_each           = toset(local.versions)
  source             = "../../tflib/publisher"
  name               = basename(path.module)
  target_repository  = var.target_repository
  config             = module.fpm-config[each.key].config
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
