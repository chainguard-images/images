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
    { for t in toset(module.version-tags-11.tag_list) : "openjdk-11-${t}" => module.eleven.image_ref },
    { for t in toset(module.version-tags-11.tag_list) : "openjdk-11-${t}-dev" => module.eleven-dev.image_ref },
    { "openjdk-11" : module.eleven.image_ref, "openjdk-11-dev" : module.eleven-dev.image_ref },
    { for t in toset(module.version-tags-17.tag_list) : "openjdk-17-${t}" => module.seventeen.image_ref },
    { for t in toset(module.version-tags-17.tag_list) : "openjdk-17-${t}-dev" => module.seventeen-dev.image_ref },
    { "openjdk-17" : module.seventeen.image_ref, "openjdk-17-dev" : module.seventeen-dev.image_ref },
    { "latest" : module.seventeen.image_ref, "latest-dev" : module.seventeen-dev.image_ref },
  )
}
