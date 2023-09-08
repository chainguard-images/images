module "pilot-config" { source = "./configs/pilot" }

module "pilot" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-pilot"
  config            = module.pilot-config.config
}

module "pilot-dev" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-pilot"
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.pilot.config)
  extra_packages = module.dev.extra_packages
}
