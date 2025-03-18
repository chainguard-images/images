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
  extra_packages = [
    "dash-binsh",
    // Default git signing tools - See https://github.com/git/git/blob/6a64ac7b014fa2cfa7a69af3c253bcd53a94b428/gpg-interface.c#L93-L124
    "gpg",
    "gpgsm",
    "openssh-keygen",
  ]
}

module "test-latest-wolfi" {
  for_each          = local.accounts
  source            = "./tests"
  digest            = module.latest-wolfi[each.key].image_ref
  target_repository = var.target_repository
}

module "test-latest-wolfi-dev" {
  for_each          = local.accounts
  source            = "./tests"
  digest            = module.latest-wolfi[each.key].dev_ref
  target_repository = var.target_repository
}
