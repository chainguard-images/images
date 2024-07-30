module "versions" {
  package = "gitlab-cng"
  source  = "../../tflib/versions"
}

locals {
  last = [for k, v in module.versions.versions : k if v.is_latest][0]
  name = basename(path.module)
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  extra_packages = [
    "tini",
    "tini-compat",
    "${local.name}-${each.value.version}",
    "gitlab-base-${each.value.version}",
    "${local.name}-scripts-${each.value.version}",
    "${local.name}-scripts-compat-${each.value.version}",
    "gitlab-logger-${each.value.version}",
    "gitlab-logger-compat-${each.value.version}",
    "openssh"
  ]
  for_each = module.versions.versions
  source   = "./config"
}

module "versioned" {
  build-dev         = true
  config            = module.config[each.key].config
  for_each          = module.versions.versions
  main_package      = "${local.name}-${each.value.version}"
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = var.target_repository
}

module "test-versioned" {
  digest = module.versioned[local.last].image_ref
  source = "./tests"
}

module "tagger" {
  depends_on = [module.test-versioned]
  source     = "../../tflib/tagger"
  tags       = merge([for v in module.versioned : v.latest_tag_map]...)
}

