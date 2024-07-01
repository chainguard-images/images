module "vault-config" {
  source         = "./configs/vault"
  extra_packages = ["vault", "vault-entrypoint"]
}

module "vault" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.vault-config.config
  build-dev         = true
}
