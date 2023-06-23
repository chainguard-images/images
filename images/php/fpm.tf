module "fpm" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/latest-fpm.apko.yaml")
}

module "fpm-dev" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.fpm.config)
  extra_packages = local.php_dev
}

module "version-tags-fpm" {
  source  = "../../tflib/version-tags"
  package = "php-fpm"
  config  = module.fpm.config
}

module "test-fpm" {
  source    = "./tests"
  digest    = module.fpm.image_ref
  check-fpm = true
}

module "test-fpm-dev" {
  source    = "./tests"
  digest    = module.fpm-dev.image_ref
  check-dev = true
  check-fpm = true
}