variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = file("${path.module}/configs/latest.apko.yaml")
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
}

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [module.test-latest]

  tags = {
    "latest" : module.latest.image_ref,
  }
}
