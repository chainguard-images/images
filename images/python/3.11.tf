module "three-eleven" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/3.11.apko.yaml")
}

module "three-eleven-dev" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config = jsonencode(module.three-eleven.config)
  extra_packages = concat(module.dev.extra_packages, [
    "build-base",
    "py3.11-pip",
    "python-3.11-dev"
  ])
}

module "version-tags-3_11" {
  source  = "../../tflib/version-tags"
  package = "python-3.11"
  config  = module.three-eleven.config
}

module "test-three-eleven" {
  source = "./tests"
  digest = module.three-eleven.image_ref
}

module "test-three-eleven-dev" {
  source = "./tests"

  check-dev = true # Check our dev extensions
  digest    = module.three-eleven-dev.image_ref
}
