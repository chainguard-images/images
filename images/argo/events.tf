module "events_config" { source = "./configs/events" }

module "events" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-events"
  config            = module.events_config.config
  build-dev         = true
  check-sbom        = true
}
