module "pilot-config" { source = "./configs/pilot" }

module "pilot" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = "${var.target_repository}-pilot"
  config            = module.pilot-config.config
  build-dev         = true
}
