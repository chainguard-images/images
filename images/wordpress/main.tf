variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  php_version = "php-8.4"
  source      = "./config"
}

module "latest" {
  config            = module.config.config
  main_package      = "wordpress"
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = var.target_repository
}

module "latest-dev" {
  config            = module.config.config-dev
  main_package      = "wordpress"
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = var.target_repository
}

module "test-latest" {
  digest = module.latest.image_ref
  source = "./tests"
}

module "test-latest-dev" {
  digest = module.latest-dev.image_ref
  source = "./tests"
}

module "tagger" {
  depends_on = [module.test-latest]
  source     = "../../tflib/tagger"
  tags       = module.latest.latest_tag_map
}

module "tagger-dev" {
  depends_on = [module.test-latest-dev]
  source     = "../../tflib/tagger"
  tags       = module.latest-dev.latest_tag_map
}

