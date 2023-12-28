module "wolfi" { source = "./config/wolfi" }

module "latest-wolfi" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = module.wolfi.config
  check-sbom        = false # TODO(jason): Temporarily disabled.
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
