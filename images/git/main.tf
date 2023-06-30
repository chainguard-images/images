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

module "dev" { source = "../../tflib/dev-subvariant" }

module "tagger" {
  source = "../../tflib/tagger"

  depends_on = [
    module.test-latest-alpine,
    module.test-latest-alpine-dev,
    module.test-latest-wolfi,
    module.test-latest-wolfi-dev,
  ]

  tags = merge(
    # Tagging format for alpine/musl variant:
    # - latest
    # - latest-dev
    # - latest-root
    # - latest-root-dev
    # - $v
    # - $v-dev
    # - root-$v
    # - root-$v-dev
    # Nonroot alpine variant
    { for t in toset(module.version-tags-alpine["nonroot"].tag_list) : t => module.latest-alpine["nonroot"].image_ref },
    { for t in toset(module.version-tags-alpine["nonroot"].tag_list) : "${t}-dev" => module.latest-alpine-dev["nonroot"].image_ref },
    { "latest" = module.latest-alpine["nonroot"].image_ref },
    { "latest-dev" = module.latest-alpine-dev["nonroot"].image_ref },

    # Root alpine variant
    { for t in toset(module.version-tags-alpine["root"].tag_list) : "root-${t}" => module.latest-alpine["root"].image_ref },
    { for t in toset(module.version-tags-alpine["root"].tag_list) : "root-${t}-dev" => module.latest-alpine-dev["root"].image_ref },
    { "latest-root" = module.latest-alpine["root"].image_ref },
    { "latest-root-dev" = module.latest-alpine-dev["root"].image_ref },

    # Tagging format for wolfi/glibc variant:
    # - latest-glibc
    # - latest-glibc-dev
    # - latest-glibc-root
    # - glibc-$v
    # - glibc-$v-dev
    # - glibc-root-$v
    # - glibc-root-$v-dev
    # Nonroot wolfi variant
    { for t in toset(module.version-tags-wolfi["nonroot"].tag_list) : "glibc-${t}" => module.latest-wolfi["nonroot"].image_ref },
    { for t in toset(module.version-tags-wolfi["nonroot"].tag_list) : "glibc-${t}-dev" => module.latest-wolfi-dev["nonroot"].image_ref },
    { "latest-glibc" = module.latest-wolfi["nonroot"].image_ref },
    { "latest-glibc-dev" = module.latest-wolfi-dev["nonroot"].image_ref },

    # Root wolfi variant
    { for t in toset(module.version-tags-wolfi["root"].tag_list) : "glibc-root-${t}" => module.latest-wolfi["root"].image_ref },
    { for t in toset(module.version-tags-wolfi["root"].tag_list) : "glibc-root-${t}-dev" => module.latest-wolfi-dev["root"].image_ref },
    { "latest-glibc-root" = module.latest-wolfi["root"].image_ref },
    { "latest-glibc-root-dev" = module.latest-wolfi-dev["root"].image_ref },
  )
}
