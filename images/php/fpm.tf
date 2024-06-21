module "fpm-config" {
  for_each = toset(local.versions)
  source   = "./config/fpm"

  extra_packages = [
    "php-${each.key}-curl",
    "php-${each.key}-openssl",
    "php-${each.key}-iconv",
    "php-${each.key}-mbstring",
    "php-${each.key}-mysqlnd",
    "php-${each.key}-pdo",
    "php-${each.key}-pdo_sqlite",
    "php-${each.key}-pdo_mysql",
    "php-${each.key}-sodium",
    "php-${each.key}-phar",
    "php-${each.key}",
    "php-${each.key}-fpm",
  ]
}

module "versioned-fpm" {
  for_each           = toset(local.versions)
  source             = "../../tflib/publisher"
  name               = basename(path.module)
  target_repository  = var.target_repository
  config             = module.fpm-config[each.key].config
  extra_dev_packages = ["composer"]
  main_package       = "php-${each.key}"
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

module "fpm-tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-fpm, module.test-fpm-dev]
  tags = merge(concat([
    for v in local.versions : [
      { for t in module.versioned-fpm[v].tag_list : "${t}-fpm" => module.versioned-fpm[v].image_ref },
      { for t in module.versioned-fpm[v].tag_list : "${t}-fpm-dev" => module.versioned-fpm[v].dev_ref },
      { latest-fpm = module.versioned-fpm[v].image_ref },
      { latest-fpm-dev = module.versioned-fpm[v].dev_ref },
    ]
  ]...)...)
}
