terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

data "imagetest_inventory" "inventory" {}

locals { parsed = provider::oci::parse(var.digest) }

variable "digest" {
  description = "The image digest to run tests over."
}

variable "check-dev" {
  default     = false
  description = "Whether to check for dev extensions"
}

variable "check-fpm" {
  default     = false
  description = "Whether to check for php-fpm extensions"
}

### Updated tests ###

resource "imagetest_harness_docker" "this" {
  name      = "cli"
  inventory = data.imagetest_inventory.inventory

  envs = {
    IMAGE_NAME : var.digest
  }
  mounts = [
    {
      source      = path.module
      destination = "/tests"
    }
  ]
}

resource "imagetest_feature" "config" {
  name        = "config"
  description = "check php configuration"
  harness     = imagetest_harness_docker.this

  steps = [
    {
      name = "check the version"
      cmd  = "docker run --entrypoint php --rm $IMAGE_NAME --version"
    },
    {
      name = "check openssl support"
      cmd  = "docker run --entrypoint php --rm $IMAGE_NAME -r 'phpinfo();' | grep 'OpenSSL support' | grep enabled"
    }
  ]

  labels = {
    type = "container",
  }
}

resource "imagetest_feature" "fpm" {
  count       = var.check-fpm ? 1 : 0
  name        = "fpm run"
  description = "run php-fpm"
  harness     = imagetest_harness_docker.this

  steps = [
    {
      name = "fpm-server"
      cmd  = "/tests/01-fpm-server.sh"
    },
    {
      name = "fpm-shutdown"
      cmd  = "/tests/02-shutdown.sh"
    }
  ]

  labels = {
    type = "container",
  }
}

resource "imagetest_feature" "composer" {
  count       = var.check-dev ? 1 : 0
  name        = "composer check"
  description = "run composer check"
  harness     = imagetest_harness_docker.this

  steps = [
    {
      name = "check composer version"
      cmd  = "docker run --entrypoint composer --rm $IMAGE_NAME --version"
    }
  ]


  labels = {
    type = "container",
  }
}

