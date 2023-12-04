module "workflowcontroller-config" { source = "./configs/workflowcontroller" }

module "workflowcontroller" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-workflowcontroller"
  config            = module.workflowcontroller-config.config
  build-dev         = true
}