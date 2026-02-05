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

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

variable "uid" {
  description = "The UID for running PostgreSQL"
  type        = string
}

variable "gid" {
  description = "The GID for running PostgreSQL"
  type        = string
}

variable "image_version" {}

module "bash_sandbox" {
  source            = "../../../../tflib/imagetest/sandboxes/bash/"
  target_repository = var.target_repository
}

module "tls_bash_sandbox" {
  source            = "../../../../tflib/imagetest/sandboxes/bash/"
  target_repository = var.target_repository
}

module "dind_test" {
  source = "../../../../tflib/imagetest/tests/docker-in-docker"
  name   = var.image_version

  images = {
    postgres     = var.digest
    postgres-dev = var.dev_digest
  }
  cwd = path.module

  tests = [
    {
      name  = "database setup"
      image = module.bash_sandbox.image_ref
      cmd   = "./query.sh"
      envs = {
        POSTGRES_UID = var.uid
        POSTGRES_GID = var.gid
      }
    },
    {
      name  = "tls enabled postgres"
      image = module.tls_bash_sandbox.image_ref
      cmd   = "./tls.sh"
      envs = {
        POSTGRES_UID = var.uid
        POSTGRES_GID = var.gid
      }
    }
  ]
}
