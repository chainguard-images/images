module "exec-config" { source = "./configs/exec" }

module "exec" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-exec"
  config            = module.exec-config.config
  build-dev         = true
}
