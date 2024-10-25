terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "random_pet" "suffix" {}

resource "imagetest_harness_docker" "this" {
  name      = "hugo"
  inventory = data.imagetest_inventory.this

  mounts = [
    {
      source      = path.module
      destination = "/tests"
    }
  ]
}

resource "imagetest_feature" "basic" {
  name    = "basic test"
  harness = imagetest_harness_docker.this

  steps = [
    {
      name = "Test making a new site"
      cmd  = <<EOT
        set -o errexit -o nounset -o errtrace -o pipefail -x

        cleanup() {
          docker logs ${random_pet.suffix.id}
          docker rm -f ${random_pet.suffix.id}
          docker network rm ${random_pet.suffix.id}
          docker volume rm ${random_pet.suffix.id}
        }

        trap cleanup EXIT

        # This test is designed to emulate the Hugo Quickstart application
        # which is outlined here:
        # https://gohugo.io/getting-started/quick-start/#commands

        docker volume create ${random_pet.suffix.id}

        docker network create ${random_pet.suffix.id}

        docker run --rm -v "${random_pet.suffix.id}:/hugo" --user root \
                cgr.dev/chainguard/busybox:latest-glibc /bin/sh -c "chown -R 65532:65532 /hugo"

        # Use the hugo application to bootstrap a directory structure for us.
        docker run --rm -v "${random_pet.suffix.id}:/hugo/quickstart" "${var.digest}" new site quickstart

        # Link in the "ananke" theme (per the quickstart)
        # We do this via containers because volume permissions are a nightmare.
        docker run --rm -v "${random_pet.suffix.id}:/hugo/quickstart" --workdir=/hugo/quickstart \
              cgr.dev/chainguard/git:latest-glibc init

        docker run --rm -v "${random_pet.suffix.id}:/hugo/quickstart" --workdir=/hugo/quickstart \
              cgr.dev/chainguard/git:latest-glibc-dev submodule add https://github.com/theNewDynamic/gohugo-theme-ananke "themes/ananke"

        docker run --rm -v "${random_pet.suffix.id}:/hugo/quickstart" --workdir=/hugo/quickstart \
              cgr.dev/chainguard/busybox:latest-glibc /bin/sh -c "echo \"theme = 'ananke'\" >> config.toml"

        # Start the container with a name, and detach so we can then poke at it.
        docker run --name "${random_pet.suffix.id}" --network ${random_pet.suffix.id} --detach -v "${random_pet.suffix.id}:/hugo/quickstart" \
          --workdir /hugo/quickstart \
          "${var.digest}" \
          server --bind 0.0.0.0 --port 8080

        # Give it a moment to start up.
        sleep 5

        # Check that it's up!
        docker run --rm --network ${random_pet.suffix.id} cgr.dev/chainguard/curl -v http://${random_pet.suffix.id}:8080
        EOT
    }
  ]
}
