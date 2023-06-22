module "eleven" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/openjdk-11.apko.yaml")
}

module "eleven-dev" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.eleven.config)
  extra_packages = module.dev.extra_packages
}

module "version-tags-11" {
  source  = "../../tflib/version-tags"
  package = "maven"
  config  = module.eleven.config
}

module "test-eleven" {
  source = "./tests"
  digest = module.eleven.image_ref
}

module "test-eleven-dev" {
  source = "./tests"
  digest = module.eleven-dev.image_ref
}
