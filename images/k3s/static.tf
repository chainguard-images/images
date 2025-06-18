module "config-static" {
  extra_packages = ["k3s-static"]
  source         = "./config"
}

module "latest-static" {
  build-dev          = true
  config             = module.config-static.config
  extra_dev_packages = ["bash-completion"]
  main_package       = "k3s-static"
  name               = basename(path.module)
  source             = "../../tflib/publisher"
  target_repository  = "${var.target_repository}-static"
}

module "test-latest-static" {
  digest = module.latest-static.image_ref
  source = "./tests"
}

module "tagger-static" {
  depends_on = [module.test-latest, module.test-latest-static]
  source     = "../../tflib/tagger"
  tags       = module.latest-static.latest_tag_map
}

