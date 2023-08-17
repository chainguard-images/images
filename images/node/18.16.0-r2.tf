module "eighteen-sixteen-zero" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = file("${path.module}/configs/18.16.0-r2.apko.yaml")
}

module "eighteen-sixteen-zero-dev" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.eighteen-sixteen-zero.config)
  extra_packages = concat(module.dev.extra_packages, local.node_dev_packages)
}

module "eighteen-sixteen-zero-version-tags" {
  source  = "../../tflib/version-tags"
  package = "nodejs-18"
  config  = module.eighteen-sixteen-zero.config
}

module "test-eighteen-sixteen-zero" {
  source = "./tests"
  digest = module.eighteen-sixteen-zero.image_ref
}