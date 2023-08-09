terraform {
  required_providers {
    apko = {
      source = "chainguard-dev/apko"
    }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [
    module.test-latest-wolfi,
  ]

  tags = merge(
    { for t in toset(module.version-tags-wolfi.tag_list) : "glibc-${t}" => module.latest-wolfi.image_ref },
    { "latest-glibc" = module.latest-wolfi.image_ref },
  )
}
