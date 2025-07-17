variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest-config" {
  extra_packages = [
    "crane",   # go toolchain
    "grpcurl", # go toolchain
    "oras",    # go toolchain
    "yq"       # go toolchain
  ]
  source = "./config"
}

module "latest" {
  build-dev         = true
  config            = module.latest-config.config
  main_package      = ""
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = var.target_repository
}

module "test-latest" {
  digest            = module.latest.image_ref
  source            = "./tests"
  target_repository = var.target_repository
  test_repository   = var.test_repository
}

module "tagger" {
  depends_on = [module.test-latest]
  source     = "../../tflib/tagger"
  tags = merge(
    { "latest" = module.latest.image_ref },
    { "latest-dev" = module.latest.dev_ref },
  )
}

