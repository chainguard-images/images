module "alpine" {
  providers = {
    apko = apko.alpine
  }
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/alpine.apko.yaml")
  extra_packages    = [] # Override the default, which includes `wolfi-baselayout`
}

module "test-alpine" {
  source = "./tests"
  digest = module.alpine.image_ref
}
