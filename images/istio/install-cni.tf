module "install-cni-config" { source = "./configs/install-cni" }

module "install-cni" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = "${var.target_repository}-install-cni"
  config            = module.install-cni-config.config
  build-dev         = true
}
