variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  source = "./config"
}

module "latest" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config.config
  main_package      = "prometheus-pushgateway"
  build-dev         = true
}

module "test-things" {
  source            = "./tests"
  digest            = { for k, v in module.latest : k => v.image_ref }
  target_repository = var.target_repository
}

module "tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-things]
  tags = {
    "latest"     = module.latest.image_ref
    "latest-dev" = module.latest.dev_ref
  }
}
