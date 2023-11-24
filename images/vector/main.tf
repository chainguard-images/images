variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  source = "./config"
  extra_packages = ["vector"]
}

module "versioned" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config.config
  build-dev         = true
  extra_dev_packages = [
    "build-base",
  ]
  main_package      = "vector"
}

module "test-things" {
  source = "./tests"
  digest = module.versioned.image_ref
}

module "tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-things]
  tags       = module.versioned.tag_map
}
