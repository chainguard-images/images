terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}


locals {
  component_data = {
    "server" = {
      run-as         = 65532
      entrypoint-cmd = "/usr/bin/spire-server run"
      # Leaving them empty where they are not used despite they are set to default because it errors out while being called in module 'config'
      extra_packages = []
      cmd            = ""
    },

    "agent" = {
      run-as         = 0
      entrypoint-cmd = "/usr/bin/spire-agent run"
      extra_packages = ["busybox", "libcap-utils"]
      cmd            = ""
    },

    "oidc-discovery-provider" = {
      run-as         = 65532
      entrypoint-cmd = "/usr/bin/oidc-discovery-provider"
      extra_packages = []
      cmd            = "--help"
    },
  }
  components = toset(keys(local.component_data))
}

module "config" {
  for_each       = local.components
  source         = "./config"
  name           = each.key
  run-as         = local.component_data[each.key].run-as
  entrypoint-cmd = local.component_data[each.key].entrypoint-cmd
  cmd            = local.component_data[each.key].cmd
  extra_packages = local.component_data[each.key].extra_packages
}

module "latest" {
  for_each = local.components
  source   = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = "${var.target_repository}-${each.key}"
  config            = module.config[each.key].config
  build-dev         = true
}

module "test-latest" {
  source  = "./tests"
  digests = { for k, v in module.latest : k => v.image_ref }
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
