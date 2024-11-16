variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "versions" {
  package = "cassandra"
  source  = "../../tflib/versions"
}

module "config" {
  extra_packages = [each.key, "cassandra-compat", "openjdk-11-default-jvm"]
  for_each       = module.versions.versions
  source         = "./config"
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

module "test-versioned" {
  digest            = module.versioned[each.key].image_ref
  for_each          = module.versions.versions
  source            = "./tests"
  target_repository = var.target_repository
}

module "tagger" {
  depends_on = [module.test-versioned]
  source     = "../../tflib/tagger"
  tags = merge(
    [for k in module.versions.ordered_keys : module.versioned[k].latest_tag_map]...
  )
}

