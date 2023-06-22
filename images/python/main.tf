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
    module.test-three-ten,
    module.test-three-ten-dev,
    module.test-three-eleven,
    module.test-three-eleven-dev,
  ]

  tags = merge(
    { for t in toset(module.version-tags-3_10.tag_list) : t => module.three-ten.image_ref },
    { for t in toset(module.version-tags-3_10.tag_list) : "${t}-dev" => module.three-ten-dev.image_ref },
    { for t in toset(concat(["latest"], module.version-tags-3_11.tag_list)) : t => module.three-eleven.image_ref },
    { for t in toset(concat(["latest"], module.version-tags-3_11.tag_list)) : "${t}-dev" => module.three-eleven-dev.image_ref },
  )
}
