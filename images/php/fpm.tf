module "fpm-config" { source = "./config/fpm" }

module "fpm" {
  source = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.fpm-config.config
}

module "fpm-dev" {
  source = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.fpm.config)
  extra_packages = concat(module.dev.extra_packages, ["composer"])
}

module "test-fpm" {
  source    = "./tests"
  digest    = module.fpm.image_ref
  check-fpm = true
}

module "test-fpm-dev" {
  source    = "./tests"
  check-fpm = true
  check-dev = true # Check for PIP in dev variants.
  digest    = module.fpm-dev.image_ref
}

resource "oci_tag" "latest-fpm" {
  depends_on = [module.test-fpm]
  digest_ref = module.fpm.image_ref
  tag        = "latest-fpm"
}

resource "oci_tag" "latest-fpm-dev" {
  depends_on = [module.test-fpm-dev]
  digest_ref = module.fpm-dev.image_ref
  tag        = "latest-fpm-dev"
}
