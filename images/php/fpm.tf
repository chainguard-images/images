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

# exclude the latest-dev bit, otherwise ends up with tags like `latest-dev-fpm-dev` and `latest-dev-fpm`
module "fpm-tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-fpm, module.test-fpm-dev]
  tags = merge([
    for v in local.versions : merge(
      {
        for t in module.versioned-fpm[v].tag_list : "${t}-fpm" => module.versioned-fpm[v].image_ref
        if t != "latest-dev"
      },
      {
        for t in module.versioned-fpm[v].tag_list : "${t}-fpm-dev" => module.versioned-fpm[v].dev_ref
        if t != "latest-dev"
      }
    )
  ]...)
}
