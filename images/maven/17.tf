module "seventeen" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/openjdk-17.apko.yaml")
}

module "seventeen-dev" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.seventeen.config)
  extra_packages = module.dev.extra_packages
}

module "version-tags-17" {
  source  = "../../tflib/version-tags"
  package = "maven"
  config  = module.seventeen.config
}

module "test-seventeen" {
  source = "./tests"
  digest = module.seventeen.image_ref
}

module "test-seventeen-dev" {
  source = "./tests"
  digest = module.seventeen-dev.image_ref
}
