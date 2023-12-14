module "latest-wolfi" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = file("${path.module}/configs/latest.wolfi.apko.yaml")
  check-sbom        = true
}

module "one-tirtysix-wolfi" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = file("${path.module}/configs/1.36.wolfi.apko.yaml")
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
