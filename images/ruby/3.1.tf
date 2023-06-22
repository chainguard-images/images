module "three-one" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/3.1.apko.yaml")
}

module "three-one-dev" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config = jsonencode(module.three-one.config)
  extra_packages = concat(module.dev.extra_packages, [
    "build-base",
    "ruby-3.1-dev",
    "ruby3.1-bundler",
  ])
}

module "version-tags-3_1" {
  source  = "../../tflib/version-tags"
  package = "ruby-3.1"
  config  = module.three-one.config
}

module "test-three-one" {
  source = "./tests"
  digest = module.three-one.image_ref
}

module "test-three-one-dev" {
  source = "./tests"

  digest = module.three-one-dev.image_ref
}
