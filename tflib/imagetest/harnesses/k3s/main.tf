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

variable "envs" {
  description = "Environment variables to set in the sandbox."
  type        = map(string)
  default     = {}
}

variable "k3s_image" {
  description = "The image to use for the k3s cluster."
  # Null this means use the default set by the provider.
  default = null
}

data "apko_config" "sandbox" {
  extra_packages = [
    "apk-tools",
    "bash",
    "busybox",
    "curl",
    "git",
    "helm",
    "k9s",
    "kubectl",
    "kustomize",
    "patch",
    "wolfi-base",
    "wget",
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
  # NOTE: This uses the same repo as the image being tested, but since it is
  # never tagged it is never synced downstream.
  repo   = var.target_repository
  config = data.apko_config.sandbox.config
}

module "test_libs" { source = "../../libs/" }

resource "imagetest_harness_k3s" "this" {
  name      = var.name
  inventory = var.inventory
  image     = var.k3s_image

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
      },
    ], module.test_libs.mounts)

    envs = var.envs
  }
}

output "harness" {
  value = imagetest_harness_k3s.this
}
