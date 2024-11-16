module "config-static" {
  source         = "./config"
  extra_packages = ["k3s-static"]
}

module "latest-static" {
  source             = "../../tflib/publisher"
  name               = basename(path.module)
  target_repository  = "${var.target_repository}-static"
  config             = module.config-static.config
  build-dev          = true
  main_package       = "k3s-static"
  extra_dev_packages = ["bash-completion"]
}

# Statically linked checks are performed at the package level, so just verify
# the same functionality as the regular image here.
module "test-latest-static" {
  source = "./tests"
  digest = module.latest-static.image_ref
}

module "tagger-static" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-latest-static]
  tags = {
    "latest" : module.latest-static.image_ref,
    "latest-dev" : module.latest-static.dev_ref,
  }
}

