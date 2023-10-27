terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  components = toset(["kas", "pages", "shell", "exporter"])

  // Normally the entrypoint is named like "{component}"
  // But some entrypoint are pointing to different entrypoint commands:
  entrypoint = merge({
    for k, v in local.components : k => "/usr/bin/${k}"
    }, {
    "pages" : "/scripts/entrypoint.sh /scripts/start-pages",
    "shell" : "/scripts/entrypoint.sh /scripts/process-wrapper",
    "exporter" : "/scripts/entrypoint.sh /scripts/process-wrapper",
  })
  versions = [for v in range(11, 14) : "1.${v}"]
  component_versions = merge([
    for c in local.components : merge([
      for v in local.versions : {
        "${c}-${v}" : {
          component = c
          version   = v
        }
      }
    ]...)
  ]...)
}

module "config" {
  for_each       = local.components
  source         = "./config"
  name           = each.key
  entrypoint_cmd = local.entrypoint[each.key]
}

module "latest" {
  for_each = local.components
  source   = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = "${var.target_repository}-${each.key}"
  config            = module.config[each.key].config

  build-dev = true
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

