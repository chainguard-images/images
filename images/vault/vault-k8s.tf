module "vault-k8s-config" { source = "./configs/vault-k8s" }

module "vault-k8s" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = "${var.target_repository}-k8s"
  config            = module.vault-k8s-config.config
  build-dev         = true
}
