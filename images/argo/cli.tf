module "cli-config" { source = "./configs/cli" }

module "cli" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-cli"
  config            = module.cli-config.config
  build-dev         = true
}
