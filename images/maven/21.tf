module "twentyone" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = file("${path.module}/configs/openjdk-21.apko.yaml")
  build-dev         = true
}

module "version-tags-21" {
  source  = "../../tflib/version-tags"
  package = "maven"
  config  = module.twentyone.config
}

module "test-twentyone" {
  source = "./tests"
  digest = module.twentyone.image_ref
}

