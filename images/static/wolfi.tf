module "wolfi" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/wolfi.apko.yaml")
}

module "test-wolfi" {
  source = "./tests"
  digest = module.wolfi.image_ref
}
