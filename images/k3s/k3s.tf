module "config" {
  source         = "./config"
  extra_packages = ["k3s"]
}

module "latest" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config.config
  build-dev         = true
  main_package      = "k3s"
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
}

module "tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-latest]
  tags = {
    "latest" : module.latest.image_ref,
    "latest-dev" : module.latest.dev_ref,
  }
}

