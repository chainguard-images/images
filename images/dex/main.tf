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
  package = "dex"
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

    # This will also tag the image with :v1, :v1.2, :v1.2.3, :v1.2.3-r4, for compatibility with upstream kustomize instructions.
    # TODO(jason): Do this for all images, not just dex, and potentially only for `:v1.2.3` and `:v1.2.3-r4` (not `:v1` or `:v1.2`).
    { for t in module.version-tags.tag_list : "v${t}" => module.latest.image_ref },
    { for t in module.version-tags.tag_list : "v${t}-dev" => module.latest.dev_ref },
  }
}
