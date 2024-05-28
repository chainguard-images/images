terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "this" {}

resource "imagetest_container_volume" "volume" {
  name      = "scratch-volume"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_harness_docker" "docker" {
  name      = "teleport-docker"
  inventory = data.imagetest_inventory.this

  volumes = [{
    source      = imagetest_container_volume.volume
    destination = "/data"
  }]

  mounts = [{
    source      = path.module
    destination = "/tests"
  }]

  envs = {
    IMAGE_NAME : var.digest
    VOLUME_NAME : imagetest_container_volume.volume.id
  }
}

resource "imagetest_feature" "basic" {
  name        = "basic"
  description = "Basic test for Teleport"
  harness     = imagetest_harness_docker.docker

  steps = [{
    name    = "Test Teleport"
    workdir = "/tests"
    cmd     = "/tests/check-teleport.sh"
  }]

  labels = {
    type = "container"
  }
}

# We cannot run the Helm tests ATM because it expects a variable called `teleportVersionOverride` to be set in format `vX.Y.Z` which is what we don't support in tests.
# Ref: https://goteleport.com/docs/deploy-a-cluster/helm-deployments/kubernetes-cluster/
