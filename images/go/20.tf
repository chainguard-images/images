module "twenty" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/1.20.apko.yaml")
}

module "twenty-dev" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.twenty.config)
  extra_packages = module.dev.extra_packages
}

module "version-tags-20" {
  source  = "../../tflib/version-tags"
  package = "go-1.20"
  config  = module.twenty.config
}

module "test-twenty" {
  source = "./tests"
  digest = module.twenty.image_ref
}

module "test-twenty-dev" {
  source = "./tests"
  digest = module.twenty-dev.image_ref
}
