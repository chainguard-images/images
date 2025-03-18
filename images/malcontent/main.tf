variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest-config" {
  source = "./config"
}

module "latest" {
  build-dev         = true
  config            = module.latest-config.config
  main_package      = "malcontent"
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = var.target_repository
}

module "test-latest" {
  digest = module.latest.image_ref
  source = "./tests"
}

module "tagger" {
  depends_on = [module.test-latest]
  source     = "../../tflib/tagger"
  tags       = module.latest.latest_tag_map
}

