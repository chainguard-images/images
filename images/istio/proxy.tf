module "proxy-config" { source = "./configs/proxy" }

module "proxy" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = "${var.target_repository}-proxy"
  config            = module.proxy-config.config
  build-dev         = true
}
