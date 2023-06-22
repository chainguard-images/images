module "eighteen" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/18.apko.yaml")
}

module "eighteen-dev" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.eighteen.config)
  extra_packages = concat(module.dev.extra_packages, local.node_dev_packages)
}

module "eighteen-version-tags" {
  source  = "../../tflib/version-tags"
  package = "nodejs-18"
  config  = module.eighteen.config
}

module "test-eighteen" {
  source = "./tests"
  digest = module.eighteen.image_ref
}

module "test-eighteen-dev" {
  source = "./tests"
  digest = module.eighteen-dev.image_ref
}
