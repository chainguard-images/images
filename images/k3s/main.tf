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

module "version-tags" {
  source  = "../../tflib/version-tags"
  package = "k3s"
  config  = module.latest.config
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
}

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [module.test-latest]

  tags = merge(
    { for t in toset(concat(["latest"], module.version-tags.tag_list)) : t => module.latest.image_ref },
    { for t in toset(concat(["latest"], module.version-tags.tag_list)) : "${t}-dev" => module.latest.dev_ref },
  )
}

module "tagger-aio" {
  source = "../../tflib/tagger"

  # k3s-aio is identical to k3s except for the included image bits, so
  # functionally we can share the same test
  depends_on = [module.test-latest]

  tags = merge(
    { for t in toset(concat(["latest"], module.version-tags-aio.tag_list)) : t => module.latest-aio.image_ref },
    { for t in toset(concat(["latest"], module.version-tags-aio.tag_list)) : "${t}-dev" => module.latest-aio.dev_ref },
  )
}
