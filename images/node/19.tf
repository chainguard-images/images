module "nineteen" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/19.apko.yaml")
}

module "nineteen-dev" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.nineteen.config)
  extra_packages = concat(module.dev.extra_packages, local.node_dev_packages)
}

module "nineteen-version-tags" {
  source  = "../../tflib/version-tags"
  package = "nodejs-19"
  config  = module.nineteen.config
}

module "test-nineteen" {
  source = "./tests"
  digest = module.nineteen.image_ref
}

module "test-nineteen-dev" {
  source = "./tests"
  digest = module.nineteen-dev.image_ref
}
