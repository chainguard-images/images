module "latest-alpine" {
  providers = {
    apko = apko.alpine
  }
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/latest.alpine.apko.yaml")
  # Override the module's default wolfi packages that conflict with alpine
  extra_packages = []
}


module "version-tags-alpine" {
  source  = "../../tflib/version-tags"
  package = "busybox"
  config  = module.latest-alpine.config
}

module "test-latest-alpine" {
  source = "./tests"
  digest = module.latest-alpine.image_ref
}
