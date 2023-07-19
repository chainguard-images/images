module "root" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = file("${path.module}/configs/latest-root.apko.yaml")
}

module "version-tags-root" {
  source  = "../../tflib/version-tags"
  package = "powershell"
  config  = module.root.config
}

module "test-root" {
  source = "./tests"
  digest = module.root.image_ref
}
