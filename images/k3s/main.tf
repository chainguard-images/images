variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = file("${path.module}/configs/latest.apko.yaml")
  build-dev         = true
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
}

module "tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-latest]
  tags = {
    "latest" : module.latest.image_ref,
    "latest-dev" : module.latest.dev_ref,
  }
}

module "latest-aio" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = "${var.target_repository}-allinone"
  config            = file("${path.module}/configs/latest.aio.apko.yaml")
  build-dev         = true
}

module "tagger-aio" {
  source = "../../tflib/tagger"

  # k3s-aio is identical to k3s except for the included image bits, so
  # functionally we can share the same test
  depends_on = [module.test-latest]
  tags = {
    "latest" : module.latest-aio.image_ref,
    "latest-dev" : module.latest-aio.dev_ref,
  }
}
