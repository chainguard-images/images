terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "version" {
  digest = var.digest
  script = "docker run --rm --entrypoint /usr/sbin/nginx $IMAGE_NAME -v"
}

resource "random_pet" "suffix" {}

data "imagetest_inventory" "this" {}

resource "imagetest_container_volume" "volume" {
  name      = "scratch-volume"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_harness_docker" "docker" {
  name      = "nginx"
  inventory = data.imagetest_inventory.this

  envs = {
    IMAGE_NAME : var.digest
    RANDOM_PET_SUFFIX : random_pet.suffix.id
    VOLUME_ID : imagetest_container_volume.volume.id
  }

  mounts = [
    {
      source      = path.module
      destination = "/tests"
    }
  ]

  volumes = [
    {
      source      = imagetest_container_volume.volume
      destination = "/data"
    }
  ]
}

resource "imagetest_feature" "welcome-page" {
  name    = "welcome page"
  harness = imagetest_harness_docker.docker

  steps = [
    {
      name = "Verify welcome page"
      cmd  = <<EOT
cleanup() {
  docker logs $CONTAINER_NAME
  docker rm -f $CONTAINER_NAME
  docker network rm $NETWORK_NAME
}

trap cleanup EXIT

CONTAINER_NAME="welcome-page-$RANDOM_PET_SUFFIX"
NETWORK_NAME="welcome-page-$RANDOM_PET_SUFFIX"

docker network create $NETWORK_NAME

docker run -d --network $NETWORK_NAME --name $CONTAINER_NAME $IMAGE_NAME
docker run --rm --network $NETWORK_NAME cgr.dev/chainguard/curl:latest \
  -v \
  --max-time 10 \
  http://$CONTAINER_NAME:8080/ | \
    grep '<title>Welcome to nginx!</title>'
EOT
    },
  ]
}

resource "imagetest_feature" "shutdown" {
  name    = "shutdown"
  harness = imagetest_harness_docker.docker

  steps = [
    {
      name = "Check shutdown signal"
      cmd  = <<EOT
LOGFILE=$(mktemp)
ID=$(docker run --rm -d $IMAGE_NAME)
docker attach $ID 2> $LOGFILE &
sleep 5

docker stop $ID

grep "SIGQUIT" $LOGFILE
grep "gracefully shutting down" $LOGFILE
EOT
    },
  ]
}
