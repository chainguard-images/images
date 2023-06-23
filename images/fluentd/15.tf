module "fifteen" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/edge.apko.yaml")
}

module "fifteen-dev" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.fifteen.config)
  extra_packages = local.fluentd_dev
}

module "version-tags-15" {
  source  = "../../tflib/version-tags"
  package = "ruby3.2-fluentd15"
  config  = module.fifteen.config
}

module "test-fifteen" {
  source = "./tests"
  digest = module.fifteen.image_ref
}

module "test-fifteen-dev" {
  source = "./tests"
  digest = module.fifteen-dev.image_ref
}
