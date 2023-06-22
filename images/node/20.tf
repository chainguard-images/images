module "twenty" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/20.apko.yaml")
}

module "twenty-dev" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.twenty.config)
  extra_packages = concat(module.dev.extra_packages, local.node_dev_packages)
}

module "twenty-version-tags" {
  source  = "../../tflib/version-tags"
  package = "nodejs-20"
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
