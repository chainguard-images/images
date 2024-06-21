variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  # TODO: handle multiple versions
  versions = ["8.2", "8.3"]
}

module "config" {
  for_each = toset(local.versions)
  source   = "./config"

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
    "php-${each.key}"
  ]
}

module "versioned" {
  for_each           = toset(local.versions)
  source             = "../../tflib/publisher"
  name               = basename(path.module)
  target_repository  = var.target_repository
  config             = module.config[each.key].config
  extra_dev_packages = ["composer"]
  main_package       = "php-${each.key}"
}

module "test-versioned" {
  for_each = toset(local.versions)
  source   = "./tests"
  digest   = module.versioned[each.key].image_ref
}

module "test-versioned-dev" {
  for_each  = toset(local.versions)
  source    = "./tests"
  digest    = module.versioned[each.key].dev_ref
  check-dev = true
}

module "tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-versioned, module.test-versioned-dev]
  tags       = merge([for v in local.versions : module.versioned[v].latest_tag_map]...)
}
