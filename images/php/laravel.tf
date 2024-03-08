module "laravel-config" { source = "./config/laravel" }

module "laravel" {
  source = "../../tflib/publisher"

  name               = basename(path.module)
  target_repository  = var.target_repository
  config             = module.laravel-config.config
  extra_dev_packages = ["composer", "php-xmlwriter"]
}

module "test-laravel" {
  source        = "./tests"
  digest        = module.laravel.image_ref
  check-fpm     = true
  check-laravel = true
}

module "test-laravel-dev" {
  source        = "./tests"
  check-fpm     = true
  check-dev     = true
  check-laravel = true # Check for Laravel extra packages.
  digest        = module.laravel.dev_ref
}

resource "oci_tag" "latest-laravel" {
  depends_on = [module.test-laravel]
  digest_ref = module.laravel.image_ref
  tag        = "latest-laravel"
}

resource "oci_tag" "latest-laravel-dev" {
  depends_on = [module.test-laravel-dev]
  digest_ref = module.laravel.dev_ref
  tag        = "latest-laravel-dev"
}
