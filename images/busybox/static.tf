module "config-static" {
  source = "./config/static"
}

module "latest-static" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  main_package      = "busybox-static"
  target_repository = "${var.target_repository}-static"
  config            = module.config-static.config
}

module "test-latest-static" {
  source            = "./tests"
  digest            = module.latest-static.image_ref
  target_repository = var.target_repository
}

module "tagger-static" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-latest-wolfi, module.test-latest-static]
  tags       = module.latest-static.latest_tag_map
}
