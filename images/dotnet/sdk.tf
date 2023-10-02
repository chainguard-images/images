module "sdk-config" { source = "./configs/sdk" }

module "sdk" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = "${var.target_repository}-sdk"
  config            = module.sdk-config.config
  build-dev         = true
}
