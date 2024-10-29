module "versions" {
  package = "gitlab-pages"
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
    each.key,                                                  # gitlab-pages-<version>
    replace(each.key, "gitlab-pages", "gitlab-pages-scripts"), # gitlab-pages-scripts-<version>
    replace(each.key, "gitlab-pages", "gitlab-base"),          # gitlab-base-<version>
  ]
  for_each = module.versions.versions
  source   = "./config"
}

module "versioned" {
  build-dev         = true
  config            = module.config[each.key].config
  eol               = each.value.eol
  for_each          = module.versions.versions
  main_package      = each.value.main
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = var.target_repository
  update-repo       = each.value.is_latest
}

module "test" {
  digest = module.versioned[local.last].image_ref
  source = "./tests"
}

module "tagger" {
  depends_on = [module.test]
  source     = "../../tflib/tagger"
  tags       = merge([for v in module.versioned : v.latest_tag_map]...)
}

