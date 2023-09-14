module "sdk-config" { source = "./configs/sdk" }

module "sdk" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-sdk"
  config            = module.sdk-config.config
}

module "sdk-dev" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-sdk"
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.sdk.config)
  extra_packages = module.dev.extra_packages
}
