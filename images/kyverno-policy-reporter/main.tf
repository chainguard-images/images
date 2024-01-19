terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  components = toset(["reporter", "ui", "plugin"])

  packages = {
    "reporter" : "kyverno-policy-reporter",
    "ui" : "kyverno-policy-reporter-ui",
    "plugin" : "kyverno-policy-reporter-kyverno-plugin",
  }

  repositories = {
    "reporter" : var.target_repository,
    "ui" : "${var.target_repository}-ui",
    "plugin" : "${var.target_repository}-plugin",
  }

  entrypoints = {
    "reporter" : "/usr/bin/policyreporter run",
    "ui" : "/usr/bin/policyreporter-ui",
    "plugin" : "/usr/bin/kyverno-plugin run",
  }
}

module "config" {
  for_each       = local.components
  source         = "./config"
  extra_packages = [local.packages[each.key], "${local.packages[each.key]}-compat"]
  entrypoint     = local.entrypoints[each.key]
}

module "latest" {
  for_each          = local.components
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = local.repositories[each.key]
  config            = module.config[each.key].config
  build-dev         = true
}

module "test-latest" {
  source  = "./tests"
  digests = { for k, v in module.latest : k => module.latest[k].image_ref }
}

resource "oci_tag" "latest" {
  for_each   = local.components
  depends_on = [module.test-latest]
  digest_ref = module.latest[each.key].image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  for_each   = local.components
  depends_on = [module.test-latest]
  digest_ref = module.latest[each.key].dev_ref
  tag        = "latest-dev"
}
