terraform {
  required_providers {
    apko = {
      source = "chainguard-dev/apko"
      version = "0.8.5"
    }
    oci  = { source = "chainguard-dev/oci" }
    cosign = {
      source = "chainguard-dev/cosign"
      version = "0.0.5"
    }
  }
}

provider "apko" {
  extra_repositories = var.extra_repositories
  extra_keyring      = var.extra_keyring
  default_archs      = ["x86_64", "aarch64"]
}

module "publish" {
  source = "chainguard-dev/apko/publisher"
  version = "0.0.5"

  target_repository = var.target_repository
  config            = file("${path.module}/apko.yaml")
  extra_packages    = var.extra_packages
}

data "oci_exec_test" "test" {
  for_each = toset(var.test_file_paths)

  digest = module.publish.image_ref
  script = file(each.key)
}

# TODO: This can be achieved with a dependency block
# module "version-tags" {
#   source  = "../version-tags"
#   package = var.package_name
#   config  = module.latest.config
# }
# resource "oci_tag" "version-tags" {
#   depends_on = [module.test-latest]
#   for_each   = toset(concat(["latest"], module.version-tags.tag_list))

#   digest_ref = module.latest.image_ref
#   tag        = "${each.key}${var.tag_suffix}"
# }