# embedded does not have a dev variant since the dev packages are already there
module "latest-embedded" {
  source = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = "${var.target_repository}-embedded"
  config            = file("${path.module}/configs/latest.embedded.apko.yaml")
}

module "test-embedded" {
  source = "./tests"
  digest = module.latest-embedded.image_ref
}

module "version-tags-embedded" {
  source  = "../../tflib/version-tags"
  package = "k3s-embedded"
  config  = module.latest-embedded.config
}
