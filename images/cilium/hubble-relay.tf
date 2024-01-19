module "hubble-relay-config" { source = "./configs/hubble-relay" }

module "hubble-relay" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-hubble-relay"
  config            = module.hubble-relay-config.config
  build-dev         = true
}
