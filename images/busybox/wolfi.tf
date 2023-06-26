module "latest-wolfi" {
  source = "../../tflib/publisher"

  target_repository = var.target_repository
  config            = file("${path.module}/configs/latest.wolfi.apko.yaml")
}

module "version-tags-wolfi" {
  source  = "../../tflib/version-tags"
  package = "busybox"
  config  = module.latest-wolfi.config
}

module "test-latest-wolfi" {
  source = "./tests"
  digest = module.latest-wolfi.image_ref
}
