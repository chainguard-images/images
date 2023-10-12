module "kas-config" { source = "./config/gitlab-kas" }

module "kas" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = "${var.target_repository}-kas"
  config            = module.kas-config.config
  build-dev         = true
}