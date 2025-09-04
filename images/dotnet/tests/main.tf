terraform {
  required_providers {
    apko      = { source = "chainguard-dev/apko" }
    imagetest = { source = "chainguard-dev/imagetest" }
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

data "imagetest_inventory" "inventory" {
}

resource "imagetest_container_volume" "volume" {
  inventory = data.imagetest_inventory.inventory
  name      = "container-volume"
}

resource "imagetest_harness_docker" "docker" {
  envs = {
    SDK_IMAGE : var.digests.sdk
    RUNTIME_IMAGE : var.digests.runtime
    VOLUME_ID : imagetest_container_volume.volume.id
  }
  inventory = data.imagetest_inventory.inventory
  mounts = [
    {
      source      = path.module
      destination = "/tests"
    }
  ]
  name = "docker"
  volumes = [
    {
      source      = imagetest_container_volume.volume
      destination = "/data"
    }
  ]
}

resource "imagetest_feature" "test" {
  harness = imagetest_harness_docker.docker
  name    = "docker-test"
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

