terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "inventory" {}

resource "imagetest_container_volume" "volume" {
  name      = "tf-volume"
  inventory = data.imagetest_inventory.inventory
}

resource "imagetest_harness_docker" "docker" {
  name      = "docker"
  inventory = data.imagetest_inventory.inventory
  mounts = [{
    source      = path.module
    destination = "/tests"
  }]
  volumes = [{
    source      = imagetest_container_volume.volume
    destination = "/testtf"
  }]

  envs = {
    IMAGE_NAME : var.digest
    VOLUME_ID : imagetest_container_volume.volume.id
  }
}

resource "imagetest_feature" "test" {
  name    = "docker-test"
  harness = imagetest_harness_docker.docker
  steps = [
    {
      name = "version check"
      cmd  = "docker run --rm $IMAGE_NAME version"
    },
    {
      name = "main.tf file into workspace"
      cmd  = <<EOF
        cp -r /tests/testtf/* /testtf
      EOF
    },
    {
      name = "run terraform commands"
      cmd  = <<EOF
        docker run --rm -v $VOLUME_ID:/testtf -w /testtf $IMAGE_NAME init
        docker run --rm -v $VOLUME_ID:/testtf -w /testtf $IMAGE_NAME apply -auto-approve
        docker run --rm -v $VOLUME_ID:/testtf -w /testtf $IMAGE_NAME output random
      EOF
    },
    {
      name = "validate string output"
      cmd  = <<EOF
        docker run --rm -v $VOLUME_ID:/testtf -w /testtf $IMAGE_NAME output -json | jq -r '.random.value'
        printf "The random string is : %s\n" $(docker run --rm -v $VOLUME_ID:/testtf -w /testtf $IMAGE_NAME output -json | jq -r '.random.value')
      EOF
    }
  ]
}
