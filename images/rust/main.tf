variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest" {
  source             = "../../tflib/publisher"
  name               = basename(path.module)
  target_repository  = var.target_repository
  config             = file("${path.module}/configs/latest.apko.yaml")
  extra_dev_packages = ["rustup"]
}

module "version-tags" {
  source  = "../../tflib/version-tags"
  package = "rust"
  config  = module.latest.config
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
}

module "test-latest-dev" {
  source    = "./tests"
  digest    = module.latest.dev_ref
  check-dev = true
}

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [
    module.test-latest,
    module.test-latest-dev,
  ]

  tags = merge(
    { for t in toset(concat(["latest"], module.version-tags.tag_list)) : t => module.latest.image_ref },
    { for t in toset(concat(["latest"], module.version-tags.tag_list)) : "${t}-dev" => module.latest.dev_ref },
  )
}
