terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

locals {
  components = toset([
    "aws",
    "iam",
    "rds",
    "s3",
  ])

  // Normally the package is named like "crossplane-provider-aws-{component}"
  // But some packages are named differently:
  // - aws -> crossplane-provider-aws-family
  packages = merge({
    for k, v in local.components : k => "crossplane-provider-aws-${k}"
    }, {
    "aws" : "crossplane-provider-aws-family",
  })

  // Normally the repository is named like "crossplane-provider-aws-{component}"
  // But some repositories are named differently:
  // - aws -> crossplane-provider-aws
  repositories = merge({
    for k, v in local.components : k => "${var.target_repository}-${k}"
    }, {
    "aws" : var.target_repository,
  })
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest" {
  for_each = local.components
  source   = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = local.repositories[each.key]
  config            = file("${path.module}/configs/latest.${each.key}.apko.yaml")
}

module "version-tags" {
  for_each = local.components
  source   = "../../tflib/version-tags"

  package = local.packages[each.key]
  config  = module.latest[each.key].config
}

module "test-latest" {
  source = "./tests"

  digests = { for k, v in module.latest : k => v.image_ref }
}

module "tagger" {
  for_each = local.components
  source   = "../../tflib/tagger"

  depends_on = [module.test-latest]

  tags = merge(
    { for t in toset(concat(["latest"], module.version-tags[each.key].tag_list)) : t => module.latest[each.key].image_ref },
  )
}
