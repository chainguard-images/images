module "wolfi" { source = "./config/wolfi" }

module "latest-wolfi" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = module.wolfi.config
}

module "test-latest-wolfi" {
  source            = "./tests"
  digest            = module.latest-wolfi.image_ref
  target_repository = var.target_repository
}
