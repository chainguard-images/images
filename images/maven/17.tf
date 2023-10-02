module "seventeen" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = file("${path.module}/configs/openjdk-17.apko.yaml")
  build-dev         = true
}

module "version-tags-17" {
  source  = "../../tflib/version-tags"
  package = "maven"
  config  = module.seventeen.config
}

module "test-seventeen" {
  source = "./tests"
  digest = module.seventeen.image_ref
}

