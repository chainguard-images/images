terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
    apko      = { source = "chainguard-dev/apko" }
  }
}

variable "name" {
  description = "The name of the harness."
}

variable "inventory" {
  description = "The inventory where the harness will be registered."
}

variable "target_repository" {
  description = "The repository where the sandbox image will be pushed."
}

variable "cwd" {
  description = "The current working directory of the image's tests. This is almost always just 'path.module'."
}

data "apko_config" "sandbox" {
  extra_packages = [
    "apk-tools",
    "bash",
    "busybox",
    "curl",
    "helm",
    "k9s",
    "kubectl",
    "kustomize",
    "wolfi-base",
  ]
  config_contents = jsonencode({
    accounts   = { run-as = 0 }
    entrypoint = { command = "tail -f /dev/null" }
    work-dir   = "/it/work"
    environment = {
      "WORK" : "/it/work",
      "LIBS" : "/it/lib",
    }
  })
}

resource "apko_build" "sandbox" {
  repo   = "${var.target_repository}-itsandbox"
  config = data.apko_config.sandbox.config
}

module "test_libs" { source = "../../libs/" }

resource "imagetest_harness_k3s" "this" {
  name      = var.name
  inventory = var.inventory

  sandbox = {
    image = apko_build.sandbox.image_ref
    # TODO: Replace these mounts (which are not concurent-safe) with an
    # `oci_append` image which offers a truer workspace sandbox independent
    # across tests.
    mounts = concat([
      {
        # Test directory
        source      = var.cwd
        destination = "/it/work"
    }], module.test_libs.mounts)
  }
}

output "harness" {
  value = imagetest_harness_k3s.this
}
