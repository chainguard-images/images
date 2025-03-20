terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "this" {
}

resource "imagetest_harness_docker" "docker" {
  envs = {
    IMAGE_NAME : var.digest
  }
  inventory = data.imagetest_inventory.this
  name      = "docker"
}

resource "imagetest_feature" "test" {
  harness = imagetest_harness_docker.docker
  name    = "docker-test"
  steps = [{
    name = "test dfc conversion"
    cmd  = <<EOT
      set -ex

      # Basic commands
      docker run --rm $IMAGE_NAME --version
      docker run --rm $IMAGE_NAME --help

      # Check dfc conversion functionality
      TMPDIR="$(mktemp -d)"

      # Create a file we will pass to dfc for conversion
      cat <<DOCKERFILE_INPUT > $TMPDIR/example.input.Dockerfile
      FROM node
      RUN apt-get update && apt-get install -y nano
      DOCKERFILE_INPUT

      # What we expect the file to get converted to
      cat <<DOCKERFILE_EXPECTED > $TMPDIR/example.expected.Dockerfile
      FROM cgr.dev/ORG/node:latest-dev
      USER root
      RUN apk add -U nano
      DOCKERFILE_EXPECTED

      # Convert it
      docker run -v $TMP_DIR:/work $IMAGE_NAME \
        ./example.before.Dockerfile > ./example.got.Dockerfile

      # Make sure what we got matches what we expect
      if [ "$(diff ./example.got.Dockerfile ./example.expected.Dockerfile) " != "" ]; then
        echo "The converted Dockerfile did not match as expected"
        exit 1
      fi
EOT
  }]
}

