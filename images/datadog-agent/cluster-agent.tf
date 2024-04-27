module "cluster-agent-config" { source = "./config/cluster-agent" }

module "cluster-agent" {
  source = "../../tflib/publisher"
  name   = basename(path.module)
  # ensure this is "/datadog-cluster-agent" instead of "/datadog-agent-cluster"
  target_repository = "${split("-agent", var.target_repository)[0]}-cluster-agent"
  config            = module.cluster-agent-config.config

  build-dev = true
}

