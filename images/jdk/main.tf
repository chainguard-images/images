terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "dev" { source = "../../tflib/dev-subvariant" }

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [
    module.test-eleven,
    module.test-seventeen,
  ]

  tags = merge(
    { for t in toset(module.version-tags-11.tag_list) : "openjdk-${t}" => module.eleven.image_ref },
    { for t in toset(module.version-tags-11.tag_list) : "openjdk-${t}-dev" => module.eleven-dev.image_ref },
    { for t in toset(module.version-tags-17.tag_list) : "openjdk-${t}" => module.seventeen.image_ref },
    { for t in toset(module.version-tags-17.tag_list) : "openjdk-${t}-dev" => module.seventeen-dev.image_ref },
    { "latest" : module.seventeen.image_ref, "latest-dev" : module.seventeen-dev.image_ref },
  )
}

module "output" {
  source = "../../tflib/image-outputer"
  images = {
    "eleven"        = module.eleven
    "eleven-dev"    = module.eleven-dev
    "seventeen"     = module.seventeen
    "seventeen-dev" = module.seventeen-dev
  }
  tagger = module.tagger
}

output "images" {
  value = module.output.images
}
