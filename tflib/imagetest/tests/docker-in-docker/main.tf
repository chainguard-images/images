terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "name" {
  description = "The name of the test."
  default     = null
}

variable "images" {
  description = "The map of images to test."
  type        = map(string)
}

variable "dind_image" {
  description = "The dind image to use."
  default     = "cgr.dev/chainguard/docker-dind:latest"
}

variable "cwd" {
  description = "Path to current module ; added to content for all test if provided"
  default     = ""
}

variable "tests" {
  description = "The list of tests to run with the docker in docker driver."
  type = list(object({
    name  = string
    image = string
    cmd   = string
    content = optional(list(object({
      source = string
      target = optional(string)
    })))
    envs       = optional(map(string), null)
    on_failure = optional(list(string), null)
  }))
}

variable "driver_config" {
  description = "Optional dind driver configuration. The full supported configuration is documented here: https://registry.terraform.io/providers/chainguard-dev/imagetest/latest/docs/resources/tests#nested-schema-for-driversdocker_in_docker"
  type        = any
  default     = {}
}

locals {
  default_on_failure = [
    "docker ps -a",
    "docker ps -a --filter status=exited --filter status=dead -q | xargs -r docker logs --tail 50",
  ]

  tests = [for test in var.tests : merge(test, {
    content = concat(test.content != null ? test.content : [],
      var.cwd != "" ? [{ source = var.cwd }] : [],
      [
        {
          source = "${path.module}/../../libs"
          target = "/imagetest/libs"
        }
      ],
    )
    on_failure = test.on_failure != null ? test.on_failure : local.default_on_failure
  })]
}

resource "imagetest_tests" "dockerindocker" {
  name   = var.name
  driver = "docker_in_docker"

  drivers = {
    docker_in_docker = merge({
      image   = var.dind_image
      mirrors = ["https://mirror.gcr.io"]
    }, var.driver_config)
  }

  images = var.images

  tests = local.tests
}

output "tests" {
  value = imagetest_tests.dockerindocker
}
