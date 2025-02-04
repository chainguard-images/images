variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "versions" {
  package = "docker-dind"
  source  = "../../tflib/versions"
}

module "config" {
  extra_packages = [
    "docker-dind",
    "dockerd-oci-entrypoint",
    "docker",
  ]
  for_each = module.versions.versions
  source   = "./config"
}

module "versioned" {
  build-dev         = true
  config            = module.config[each.key].config
  eol               = each.value.eol
  for_each          = module.versions.versions
  main_package      = "docker-dind"
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  tags_suffix       = "-root"
  target_repository = var.target_repository
  update-repo       = each.value.is_latest
}

module "tests" {
  digest          = module.versioned[each.key].image_ref
  for_each        = module.versions.versions
  source          = "./tests"
  test_repository = var.test_repository
}

module "tagger" {
  depends_on = [module.tests]
  source     = "../../tflib/tagger"
  tags = merge(
    [for k in module.versions.ordered_keys : module.versioned[k].latest_tag_map]...
  )
}

