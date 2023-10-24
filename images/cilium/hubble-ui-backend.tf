module "hubble-ui-backend-config" { source = "./configs/hubble-ui-backend" }

module "hubble-ui-backend" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-hubble-ui-backend"
  config            = module.hubble-ui-backend-config.config
  build-dev         = true
}
