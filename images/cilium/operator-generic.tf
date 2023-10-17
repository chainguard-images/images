module "operator-config" { source = "./configs/operator" }

module "operator" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-operator-generic"
  config            = module.operator-config.config
  build-dev         = true
}
