terraform {
  required_providers {
    apko = {
      source                = "chainguard-dev/apko"
      configuration_aliases = [apko.alpine]
    }
  }
}

locals {
  accounts = toset(["nonroot", "root"])
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [
    module.test-latest-alpine,
    module.test-latest-alpine-dev,
    module.test-latest-wolfi,
    module.test-latest-wolfi-dev,
  ]

  tags = merge(
    // Alpine-based tags.
    { "latest" = module.latest-alpine["nonroot"].image_ref },
    { "latest-dev" = module.latest-alpine["nonroot"].dev_ref },
    { "latest-root" = module.latest-alpine["root"].image_ref },
    { "latest-root-dev" = module.latest-alpine["root"].dev_ref },

    // Wolfi-based tags:
    { "latest-glibc" = module.latest-wolfi["nonroot"].image_ref },
    { "latest-glibc-dev" = module.latest-wolfi["nonroot"].dev_ref },
    { "latest-glibc-root" = module.latest-wolfi["root"].image_ref },
    { "latest-glibc-root-dev" = module.latest-wolfi["root"].dev_ref },
  )
}
