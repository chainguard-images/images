module "agent-config" { source = "./configs/agent" }

module "agent" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-agent"
  config            = module.agent-config.config
  build-dev         = true
}
