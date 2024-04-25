module "agent-config" { source = "./config/agent" }

module "agent" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.agent-config.config

  build-dev = true
}

