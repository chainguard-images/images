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
    "openssh",
    "tini",
    "tini-compat",

    # Note: The versions are coming from package "gitlab-cng"
    replace(each.key, "gitlab-cng", "gitlab-shell"),                # gitlab-exporter-<version>
    replace(each.key, "gitlab-cng", "gitlab-base"),                 # gitlab-base-<version>
    replace(each.key, "gitlab-cng", "gitlab-shell-scripts"),        # gitlab-shell-scripts-<version>
    replace(each.key, "gitlab-cng", "gitlab-shell-scripts-compat"), # gitlab-shell-scripts-compat-<version>
    replace(each.key, "gitlab-cng", "gitlab-logger"),               # gitlab-logger-<version>
    replace(each.key, "gitlab-cng", "gitlab-logger-compat"),        # gitlab-logger-compat-<version>
  ]
  for_each = module.versions.versions
  source   = "./config"
}

module "versioned" {
  build-dev         = true
  config            = module.config[each.key].config
  for_each          = module.versions.versions
  main_package      = replace(each.value.main, "gitlab-cng", "gitlab-shell")
  name              = basename(path.module)
  source            = "../../tflib/publisher"
  target_repository = var.target_repository
  update-repo       = each.value.is_latest
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

