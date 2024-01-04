module "root" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = file("${path.module}/configs/latest-root.apko.yaml")
}

module "test-root" {
  source = "./tests"
  digest = module.root.image_ref
}
