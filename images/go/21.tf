module "twenty-one" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/1.21.apko.yaml")
}

module "twenty-one-dev" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.twenty-one.config)
  extra_packages = module.dev.extra_packages
}

module "version-tags-21" {
  source  = "../../tflib/version-tags"
  package = "go-1.21"
  config  = module.twenty-one.config
}

module "test-twenty-one" {
  source = "./tests"
  digest = module.twenty-one.image_ref
}

module "test-twenty-one-dev" {
  source = "./tests"
  digest = module.twenty-one-dev.image_ref
}
