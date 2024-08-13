module "config-aio" {
  source         = "./config"
  extra_packages = ["k3s", "k3s-images"]
}

module "latest-aio" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = "${var.target_repository}-allinone"
  config            = module.config-aio.config
  build-dev         = true
  main_package      = "k3s"
}

module "tagger-aio" {
  source = "../../tflib/tagger"

  # k3s-aio is identical to k3s except for the included image bits, so
  # functionally we can share the same test
  depends_on = [module.test-latest]
  tags = {
    "latest" : module.latest-aio.image_ref,
    "latest-dev" : module.latest-aio.dev_ref,
  }
}
