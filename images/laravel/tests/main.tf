terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "check-dev" {
  default     = false
  description = "Whether to check for dev extensions"
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --entrypoint php --rm $IMAGE_NAME --version"
}

variable "target_repository" {}

module "bash_sandbox" {
  source            = "../../../tflib/imagetest/sandboxes/bash"
  target_repository = var.target_repository
}

module "fpm-server-test" {
  source = "../../../tflib/imagetest/tests/docker-in-docker/"

  images = { laravel = var.digest }

  tests = concat(
    [{
      name    = "fmp server test"
      image   = module.bash_sandbox.image_ref
      content = [{ source = path.module }]
      cmd     = "./01-fpm-server.sh"
    }],
  )
}

data "oci_exec_test" "fpm-shutdown" {
  digest = var.digest
  script = "${path.module}/02-shutdown.sh"
}

data "oci_exec_test" "laravel-extensions" {
  digest = var.digest
  script = "docker run --rm --entrypoint php $IMAGE_NAME -m | grep fileinfo"
}

data "oci_exec_test" "composer" {
  count  = var.check-dev ? 1 : 0
  digest = var.digest
  script = "docker run --entrypoint composer --rm $IMAGE_NAME --version"
}
