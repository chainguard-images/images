terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "config" {
  source   = "./config"
  rootless = false
}

module "latest-root" {
  source = "../../tflib/publisher"

  name              = "buildkit"
  target_repository = var.target_repository
  config            = module.config.config
  build-dev         = true
  main_package      = "buildkitd"
}

data "oci_exec_test" "test-latest-root" {
  // Test uses buildctl-daemonless.sh script, which requires a few script tools to function (i.e. awk).
  // See https://github.com/moby/buildkit#daemonless for more details on daemonless.
  // TODO: Should we include awk / other script dependencies in the non-dev image?
  digest = module.latest-root.dev_ref
  script = "${path.module}/tests/build.sh"
}

resource "oci_tag" "latest-root" {
  depends_on = [data.oci_exec_test.test-latest-root]
  digest_ref = module.latest-root.image_ref
  tag        = "latest-root"
}

resource "oci_tag" "latest-root-dev" {
  depends_on = [data.oci_exec_test.test-latest-root]
  digest_ref = module.latest-root.dev_ref
  tag        = "latest-root-dev"
}

// TODO: rootless requires more packages to be installed to function properly.
// Disabling for now.
/*
module "config-rootless" {
  source   = "./config"
  rootless = true
}

module "rootless" {
  source = "../../tflib/publisher"

  name              = "buildkit-rootless"
  target_repository = var.target_repository
  config            = module.config-rootless.config
  build-dev         = true
  main_package      = "buildkitd"
}

data "oci_exec_test" "test-rootless" {
  digest = module.rootless.dev_ref
  script = "${path.module}/tests/build-rootless.sh"
}

resource "oci_tag" "latest" {
  depends_on = [module.test-rootless]
  digest_ref = module.rootless.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test-rootless]
  digest_ref = module.rootless.dev_ref
  tag        = "latest-dev"
}
*/