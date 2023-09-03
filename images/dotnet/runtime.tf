module "runtime-config" { source = "./configs/runtime" }

module "runtime" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-runtime"
  config            = module.runtime-config.config
}

module "runtime-dev" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-runtime"
  # Make the dev variant an explicit extension of the
  # locked original.
  config         = jsonencode(module.runtime.config)
  extra_packages = module.dev.extra_packages
}
