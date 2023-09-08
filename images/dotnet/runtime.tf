module "runtime-config" { source = "./configs/runtime" }

module "runtime" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = "${var.target_repository}-runtime"
  config            = module.runtime-config.config
  build-dev         = true
}
