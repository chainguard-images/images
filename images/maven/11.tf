module "eleven" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = file("${path.module}/configs/openjdk-11.apko.yaml")
  build-dev         = true
}

module "version-tags-11" {
  source  = "../../tflib/version-tags"
  package = "maven"
  config  = module.eleven.config
}

module "test-eleven" {
  source = "./tests"
  digest = module.eleven.image_ref
}

