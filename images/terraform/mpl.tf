module "mpl-config" {
  source         = "./config"
  extra_packages = ["terraform~1.5"]
}

module "mpl" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.mpl-config.config
  build-dev         = true
}

module "test-mpl" {
  source = "./tests"
  digest = module.mpl.image_ref
}

data "oci_exec_test" "mpl" {
  depends_on = [module.test-mpl]
  digest     = module.mpl.dev_ref
  script     = <<EOF
terraform version | grep 1.5
  EOF
}

locals { mpl_tags = toset(["1.5.7", "1.5", "latest-mpl"]) }

resource "oci_tag" "mpl" {
  for_each   = local.mpl_tags
  depends_on = [module.test-mpl]
  digest_ref = module.mpl.image_ref
  tag        = each.key
}

resource "oci_tag" "mpl-dev" {
  for_each   = local.mpl_tags
  depends_on = [module.test-mpl]
  digest_ref = module.mpl.dev_ref
  tag        = "${each.key}-dev"
}
