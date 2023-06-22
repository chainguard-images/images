module "three-zero" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/3.0.apko.yaml")
}

module "three-zero-dev" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config = jsonencode(module.three-zero.config)
  extra_packages = concat(module.dev.extra_packages, [
    "build-base",
    "ruby-3.0-dev",
    "ruby3.0-bundler",
  ])
}

module "version-tags-3_0" {
  source  = "../../tflib/version-tags"
  package = "ruby-3.0"
  config  = module.three-zero.config
}

module "test-three-zero" {
  source = "./tests"
  digest = module.three-zero.image_ref
}

module "test-three-zero-dev" {
  source = "./tests"

  digest = module.three-zero-dev.image_ref
}
