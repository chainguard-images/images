terraform {
  required_providers {
    apko = {
      source                = "chainguard-dev/apko"
      configuration_aliases = [apko.alpine]
    }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [
    module.test-latest-alpine,
    module.test-latest-wolfi,
  ]

  tags = merge(
    { "latest" = module.latest-alpine.image_ref },
    { "latest-glibc" = module.latest-wolfi.image_ref },
  )
}
