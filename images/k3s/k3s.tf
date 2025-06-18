module "config" {
  extra_packages = ["k3s", "containerd-shim-runc-v2~1"]
  source         = "./config"
}

module "latest" {
  build-dev          = true
  config             = module.config.config
  extra_dev_packages = ["bash-completion"]
  main_package       = "k3s"
  name               = basename(path.module)
  source             = "../../tflib/publisher"
  target_repository  = var.target_repository
}

module "test-latest" {
  digest = module.latest.image_ref
  source = "./tests"
}

module "tagger" {
  depends_on = [module.test-latest, module.test-latest-static]
  source     = "../../tflib/tagger"
  tags       = module.latest.latest_tag_map
}

