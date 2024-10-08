terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "inventory" {}

resource "random_integer" "port" {
  min = 1024
  max = 65535
}

resource "imagetest_harness_docker" "docker" {
  name      = "docker"
  inventory = data.imagetest_inventory.inventory

  envs = {
    IMAGE_NAME : "${local.parsed.registry_repo}:${local.parsed.pseudo_tag}"
    BUSYBOX : "cgr.dev/chainguard/busybox:latest"
    REGISTRY : "registry:2"
    REGISTRY_PORT : random_integer.port.result
  }
}

resource "imagetest_feature" "test" {
  name    = "docker-cli-tests"
  harness = imagetest_harness_docker.docker

  steps = [{
    name = "Version check"
    cmd  = "docker run -v /var/run/docker.sock:/var/run/docker.sock --rm $IMAGE_NAME version"
    }, {
    name = "Pull busybox"
    cmd  = "docker run -v /var/run/docker.sock:/var/run/docker.sock --rm $IMAGE_NAME pull $BUSYBOX"
    }, {
    name = "Hello world with busybox"
    cmd  = "docker run -v /var/run/docker.sock:/var/run/docker.sock --rm $IMAGE_NAME run $BUSYBOX echo hello world"
    }, {
    name = "Tag busybox"
    cmd  = "docker run -v /var/run/docker.sock:/var/run/docker.sock --rm $IMAGE_NAME tag $BUSYBOX localhost:$REGISTRY_PORT/busybox"
    }, {
    name = "Start local registry"
    cmd  = "docker run -v /var/run/docker.sock:/var/run/docker.sock --rm $IMAGE_NAME run --rm -d -p $REGISTRY_PORT:5000 $REGISTRY"
    }, {
    name  = "Push busybox to local registry"
    cmd   = "docker run -v /var/run/docker.sock:/var/run/docker.sock --rm $IMAGE_NAME push localhost:$REGISTRY_PORT/busybox"
    retry = { attempts = 5, delay = "3s" }
  }]
}
