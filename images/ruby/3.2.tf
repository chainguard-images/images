module "three-two" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/3.2.apko.yaml")
}

module "three-two-dev" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config = jsonencode(module.three-two.config)
  extra_packages = concat(module.dev.extra_packages, [
    "build-base",
    "ruby-3.2-dev",
    "ruby3.2-bundler",
  ])
}

module "version-tags-3_2" {
  source  = "../../tflib/version-tags"
  package = "ruby-3.2"
  config  = module.three-two.config
}

module "test-three-two" {
  source = "./tests"
  digest = module.three-two.image_ref
}

module "test-three-two-dev" {
  source = "./tests"

  digest = module.three-two-dev.image_ref
}
