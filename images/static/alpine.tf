module "alpine" {
  providers = {
    apko = apko.alpine
  }
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = file("${path.module}/configs/alpine.apko.yaml")
  extra_packages    = []    # Override the default, which includes `wolfi-baselayout`
  check-sbom        = false # Alpine-based SBOMs are not conformant because the Alpine baselayout has an invalid license specifier
}

module "test-alpine" {
  source = "./tests"
  digest = module.alpine.image_ref
}
