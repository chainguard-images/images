variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  versions = [element(module.versions.ordered_keys, length(module.versions.ordered_keys) - 1)]
}

module "versions" {
  source  = "../../tflib/versions"
  package = "php"
}

module "config" {
  for_each = toset(local.versions)
  source   = "./config"

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
    "${each.key}"
  ]
}

module "versioned" {
  for_each           = toset(local.versions)
  source             = "../../tflib/publisher"
  name               = basename(path.module)
  target_repository  = var.target_repository
  config             = module.config[each.key].config
  extra_dev_packages = ["composer"]
  main_package       = each.key
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
