module "three-ten" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/3.10.apko.yaml")
}

module "three-ten-dev" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config = jsonencode(module.three-ten.config)
  extra_packages = concat(module.dev.extra_packages, [
    "build-base",
    "py3.10-pip",
    "python-3.10-dev"
  ])
}

module "version-tags-3_10" {
  source  = "../../tflib/version-tags"
  package = "python-3.10"
  config  = module.three-ten.config
}

module "test-three-ten" {
  source = "./tests"
  digest = module.three-ten.image_ref
}

module "test-three-ten-dev" {
  source = "./tests"

  check-dev = true # Check our dev extensions
  digest    = module.three-ten-dev.image_ref
}
