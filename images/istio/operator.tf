module "operator-config" { source = "./configs/operator" }

module "operator" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-operator"
  config            = module.operator-config.config
}

module "operator-dev" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-operator"
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.operator.config)
  extra_packages = module.dev.extra_packages
}
