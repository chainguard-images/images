module "proxy-config" { source = "./configs/proxy" }

module "proxy" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-proxy"
  config            = module.proxy-config.config
}

module "proxy-dev" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-proxy"
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.proxy.config)
  extra_packages = module.dev.extra_packages
}
