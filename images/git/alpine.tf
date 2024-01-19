module "alpine" {
  for_each           = local.accounts
  source             = "./config"
  root               = each.key == "root"
  extra_repositories = ["https://dl-cdn.alpinelinux.org/alpine/edge/community"]
}

module "latest-alpine" {
  providers = {
    apko = apko.alpine
  }
  for_each          = local.accounts
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.alpine[each.key].config
  check-sbom        = false # Alpine-based SBOMs are not conformant because the Alpine baselayout has an invalid license specifier
  build-dev         = true
}

module "test-latest-alpine" {
  for_each = local.accounts
  source   = "./tests"
  digest   = module.latest-alpine[each.key].image_ref
}

module "test-latest-alpine-dev" {
  for_each  = local.accounts
  source    = "./tests"
  digest    = module.latest-alpine[each.key].dev_ref
  check-dev = true
}
