terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "inventory" {
}

resource "imagetest_harness_docker" "docker" {
  envs = {
    IMAGE_NAME : var.digest
  }
  inventory = data.imagetest_inventory.inventory
  name      = "openscap"
}

resource "imagetest_feature" "test" {
  harness = imagetest_harness_docker.docker
  name    = "docker-test"
  steps = [{
    name = "basic test"
    # This does quite a bit of work for a `version` command, it validates oscap
    # can run (and that all the libraries are linked), but also probes the
    # supported OVAL objects and checks they are legit. The alternative
    # requires an uncomfortable level of privilege to either support
    # `oscap-docker` scans or `oscap-chroot` scans.
    cmd = "docker run --rm $IMAGE_NAME version"
  }]
}

