module "wolfi" {
  for_each = local.accounts
  source   = "./config"
  root     = each.key == "root"
}

module "latest-wolfi" {
  for_each          = local.accounts
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.wolfi[each.key].config
  check-sbom        = false # TODO: Not yet conformant: ncurses, libedit, openssh
  build-dev         = true
}

module "test-latest-wolfi" {
  for_each = local.accounts
  source   = "./tests"
  digest   = module.latest-wolfi[each.key].image_ref
}

module "test-latest-wolfi-dev" {
  for_each  = local.accounts
  source    = "./tests"
  digest    = module.latest-wolfi[each.key].dev_ref
  check-dev = true
}
