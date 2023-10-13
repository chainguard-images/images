variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest-config" { source = "./config" }

module "latest" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.latest-config.config
  build-dev         = true
}

module "version-tags" {
  source  = "../../tflib/version-tags"
  package = "dynamic-localpv-provisioner"
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
    { for t in module.version-tags.tag_list : t => module.latest.image_ref },
    { for t in module.version-tags.tag_list : "${t}-dev" => module.latest.dev_ref },
    { "latest" : module.latest.image_ref },
    { "latest-dev" : module.latest.dev_ref }
  )
}
