terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "this" {}

resource "imagetest_container_volume" "this" {
  name      = "postgresql"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_harness_docker" "this" {
  name      = "postgresql-test"
  inventory = data.imagetest_inventory.this

  privileged = false

  envs = {
    IMAGE_NAME        = var.digest
    VOLUME_ID         = imagetest_container_volume.this.id
    POSTGRES_PASSWORD = "password"
  }
  mounts = [
    {
      source      = path.module
      destination = "/tests"
    }
  ]
  volumes = [
    {
      source      = imagetest_container_volume.this
      destination = "/data"
    }
  ]
}

resource "imagetest_feature" "postgres" {
  name        = "psql"
  description = "Test Postgresql functionalities"
  harness     = imagetest_harness_docker.this

  steps = [
    {
      name = "Database setup"
      cmd  = "/tests/query.sh"
    },
    {
      name = "TLS enabled Postgres"
      cmd  = "/tests/tls.sh"
    }
  ]

  labels = { type = "container" }
}