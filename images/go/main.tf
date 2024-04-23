variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "versions" {
  source  = "../../tflib/versions"
  package = "go"

  # As of 2024-03-19 this contains all Go versions 1.17+
  # 1.17 has an EOL date of 2022-08-02, meaning it will
  # NOT be included in this list starting 2024-08-03
  eol-grace-months = 24
}

module "config" {
  for_each       = module.versions.versions
  source         = "./config"
  extra_packages = [each.key]
}

module "versioned" {
  for_each          = module.versions.versions
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.config[each.key].config
  build-dev         = true
  main_package      = each.value.main
  update-repo       = each.value.is_latest
}

module "test-things" {
  for_each = module.versions.versions
  source   = "./tests"
  digest   = module.versioned[each.key].image_ref
}

module "tagger" {
  source     = "../../tflib/tagger"
  depends_on = [module.test-things]
  tags = merge(
    [for v in module.versioned : v.latest_tag_map]...
  )
}
