module "fourteen" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/latest.apko.yaml")
}

module "fourteen-dev" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.fourteen.config)
  extra_packages = local.fluentd_dev
}

module "version-tags-14" {
  source  = "../../tflib/version-tags"
  package = "ruby3.2-fluentd14"
  config  = module.fourteen.config
}

module "test-fourteen" {
  source = "./tests"
  digest = module.fourteen.image_ref
}

module "test-fourteen-dev" {
  source = "./tests"
  digest = module.fourteen-dev.image_ref
}
