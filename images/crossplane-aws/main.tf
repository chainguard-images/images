terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  components = toset([
    "family",
    "cloudfront",
    "cloudwatchlogs",
    "dynamodb",
    "ec2",
    "eks",
    "firehose",
    "iam",
    "kms",
    "lambda",
    "rds",
    "s3",
    "sns",
    "sqs",
  ])

  // Normally the repository is named like "crossplane-provider-aws-{component}"
  // But some repositories are named differently:
  // - aws -> crossplane-provider-aws
  repositories = merge({
    for k, v in local.components : k => "${var.target_repository}-${k}"
    }, {
    "family" : var.target_repository,
  })
}

module "config" {
  for_each       = toset(local.components)
  source         = "./config"
  extra_packages = ["crossplane-provider-aws-${each.key}"]
}

module "latest" {
  for_each = toset(local.components)
  source   = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = local.repositories[each.key]
  config            = module.config[each.key].config
}

module "test-latest" {
  source  = "./tests"
  digests = { for k, v in module.latest : k => v.image_ref }
}

module "version-tags" {
  for_each = toset(local.components)
  source   = "../../tflib/version-tags"
  package  = "crossplane-provider-aws-${each.key}"
  config   = module.latest[each.key].config
}

module "tagger" {
  for_each = toset(local.components)
  source   = "../../tflib/tagger"

  depends_on = [module.test-latest]

  tags = merge(
    { for t in module.version-tags[each.key].tag_list : t => module.latest[each.key].image_ref },
    { "latest" : module.latest[each.key].image_ref },
  )
}
