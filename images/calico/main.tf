terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

locals {
  components = toset([
    "calicoctl",
    "node",
    "kube-controllers",
    "cni",
  ])

  // Normally the package is named like "calico-{component}"
  // But some packages are named differently:
  // - calicoctl -> calicoctl
  packages = merge({
    for k, v in local.components : k => "calico-${k}"
    }, {
    "calicoctl" : "calicoctl",
  })

  // Normally the repository is named like "calico-{component}"
  // But some repositories are named differently:
  // - calicoctl -> calicoctl
  repositories = merge({
    for k, v in local.components : k => "${var.target_repository}-${k}"
    }, {
    "calicoctl" : "${var.target_repository}ctl",
  })
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest" {
  for_each = local.components
  source   = "../../tflib/publisher"

  target_repository = (each.key == "calicoctl" ? "${var.target_repository}" : "${var.target_repository}-${each.key}")
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
