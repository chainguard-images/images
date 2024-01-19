module "hubble-ui-config" { source = "./configs/hubble-ui" }

module "hubble-ui" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-hubble-ui"
  config            = module.hubble-ui-config.config
  build-dev         = true
}
