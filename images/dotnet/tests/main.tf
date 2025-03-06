
terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    apko      = { source = "chainguard-dev/apko" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digests" {
  description = "The image digests to run tests over."
  type = object({
    sdk     = string
    runtime = string
  })
}

variable "test_repository" {
  description = "The docker repo root to use for sourcing test images."
}

data "imagetest_inventory" "inventory" {}

resource "imagetest_container_volume" "volume" {
  name      = "container-volume"
  inventory = data.imagetest_inventory.inventory
}

resource "imagetest_harness_docker" "docker" {
  name      = "docker"
  inventory = data.imagetest_inventory.inventory

  envs = {
    SDK_IMAGE : var.digests.sdk
    RUNTIME_IMAGE : var.digests.runtime
    VOLUME_ID : imagetest_container_volume.volume.id
  }

  volumes = [
    {
      source      = imagetest_container_volume.volume
      destination = "/data"
    }
  ]

  mounts = [
    {
      source      = path.module
      destination = "/tests"
    }
  ]
}

resource "imagetest_feature" "test" {
  name    = "docker-test"
  harness = imagetest_harness_docker.docker

  steps = [
    {
      name = "setup"
      cmd  = "/tests/setup.sh"
    },
    {
      name = "build"
      cmd  = "/tests/keypairs.sh"
    },
    {
      name = "tzdata"
      cmd  = "/tests/tzdata.sh"
    }
  ]
}
