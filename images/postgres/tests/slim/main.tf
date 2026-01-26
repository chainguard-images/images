terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "dev_digest" {
  description = "The image dev digest to run tests over."
}

variable "uid" {
  description = "The UID for running PostgreSQL"
  type        = string
}

variable "gid" {
  description = "The GID for running PostgreSQL"
  type        = string
}

data "imagetest_inventory" "this" {}

resource "imagetest_container_volume" "data" {
  name      = "postgresql"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_container_volume" "certs" {
  name      = "postgresql_certs"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_container_volume" "config" {
  name      = "postgresql_config"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_harness_docker" "this" {
  name      = "postgresql-test"
  inventory = data.imagetest_inventory.this

  privileged = false

  envs = {
    IMAGE_NAME        = var.digest
    IMAGE_NAME_DEV    = var.dev_digest
    DATA_VOLUME_ID    = imagetest_container_volume.data.id
    CERTS_VOLUME_ID   = imagetest_container_volume.certs.id
    CONFIG_VOLUME_ID  = imagetest_container_volume.config.id
    POSTGRES_PASSWORD = "password"
    # Pass UID and GID dynamically
    POSTGRES_UID = var.uid
    POSTGRES_GID = var.gid
  }
  mounts = [
    {
      source      = path.module
      destination = "/tests"
    }
  ]
  volumes = [
    {
      source      = imagetest_container_volume.data
      destination = "/data"
    },
    {
      source      = imagetest_container_volume.certs
      destination = "/certs"
    },
    {
      source      = imagetest_container_volume.config
      destination = "/config"
    },
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