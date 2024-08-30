module "operator-aws-config" { source = "./configs/operator-aws" }

module "operator-aws" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-operator-aws"
  config            = module.operator-aws-config.config
  build-dev         = true
}
