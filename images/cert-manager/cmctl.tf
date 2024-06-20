# As of cert-manager 1.15 onwards, cmctl is independently versioned, and only
# "latest" is supported
module "cmctl-config" {
  source = "./config"
  name   = "cmctl"
}

module "cmctl" {
  source = "../../tflib/publisher"

  name              = basename(path.module)
  target_repository = "${var.target_repository}-cmctl"
  config            = module.cmctl-config.config
  build-dev         = true
  main_package      = "cert-manager-cmctl"
}

resource "oci_tag" "latest" {
  depends_on = [module.test]
  digest_ref = module.cmctl.image_ref
  tag        = "latest"
}
