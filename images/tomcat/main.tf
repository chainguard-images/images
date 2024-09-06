terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

data "apko_config" "package-info" {
  config_contents = jsonencode({
    contents = {
      packages = ["tomcat"]
    }
  })
}

locals {
  // This parses the package in the dummy config from where we extract the version
  package_conf          = [for p in data.apko_config.package-info.config.contents.packages : p if startswith(p, "tomcat")][0]
  package_version       = split("=", local.package_conf)[1]    // This extracts the full version
  version_without_epoch = split("-", local.package_version)[0] // This extracts the version without the epoch
  major_minor_version   = join(".", slice(split(".", local.version_without_epoch), 0, 2))
}

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
  extra_packages = ["tomcat-${local.major_minor_version}-openjdk-${local.latest_jdk}"]
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
