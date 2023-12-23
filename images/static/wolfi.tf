module "wolfi" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = file("${path.module}/configs/wolfi.apko.yaml")
  check-sbom        = false # TODO(jason): Temporarily disabled.
}

module "test-wolfi" {
  source = "./tests"
  digest = module.wolfi.image_ref
}
