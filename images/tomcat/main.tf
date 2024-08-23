module "versions" {
  package = "tomcat"
  source  = "../../tflib/versions"
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

locals {
  latest_jdk = "21"
}

module "config" {
  extra_packages = ["tomcat-${each.value.version}-openjdk-${local.latest_jdk}"]
  for_each       = module.versions.versions
  source         = "./config"
}

module "versioned" {
  build-dev         = true
  config            = module.config[each.key].config
  for_each          = module.versions.versions
  main_package      = "${each.key}-openjdk-${local.latest_jdk}"
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = var.target_repository
  update-repo       = each.value.is_latest
}

module "test" {
  for_each = module.versions.versions
  source   = "./tests"

  digest = module.versioned[each.key].image_ref
}

module "tagger" {
  depends_on = [module.test]
  source     = "../../tflib/tagger"
  tags       = merge([for v in module.versioned : v.latest_tag_map]...)
}
