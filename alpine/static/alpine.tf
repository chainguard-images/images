module "alpine" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = file("${path.module}/configs/alpine.apko.yaml")
  extra_packages    = [] # Override the default, which includes `wolfi-baselayout`
}

module "test-alpine" {
  source = "./tests"
  digest = module.alpine.image_ref
}
