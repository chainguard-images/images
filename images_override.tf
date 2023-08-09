module "busybox" {
  source            = "./images/busybox"
  target_repository = "${var.target_repository}/busybox"
  providers = {
    apko.alpine = apko.alpine
  }
}

module "git" {
  source            = "./images/git"
  target_repository = "${var.target_repository}/git"
  providers = {
    apko.alpine = apko.alpine
  }
}

module "newrelic" {
  source            = "./images/newrelic"
  target_repository = "${var.target_repository}/newrelic"
  license_key       = var.newrelic_license_key
}

module "static" {
  source            = "./images/static"
  target_repository = "${var.target_repository}/static"
  providers = {
    apko.alpine = apko.alpine
  }
}
