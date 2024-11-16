module "busl-config" {
  source         = "./config"
  extra_packages = ["terraform"]
}

module "busl" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.busl-config.config
  build-dev         = true
}


module "test-busl" {
  source = "./tests"
  digest = module.busl.image_ref
}

data "oci_exec_test" "busl" {
  depends_on = [module.test-busl]
  digest     = module.busl.dev_ref
  script     = <<EOF
terraform version | grep -v 1.5
  EOF
}

resource "oci_tag" "latest-busl" {
  depends_on = [module.test-busl]
  digest_ref = module.busl.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-busl-dev" {
  depends_on = [module.test-busl]
  digest_ref = module.busl.dev_ref
  tag        = "latest-dev"
}
