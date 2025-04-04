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
    envs = optional(map(string), null)
  }))
}

locals {
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
  })]
}

resource "imagetest_tests" "dockerindocker" {
  name   = var.name
  driver = "docker_in_docker"

  drivers = {
    docker_in_docker = {
      image   = var.dind_image
      mirrors = ["https://mirror.gcr.io"]
    }
  }

  images = var.images

  tests = local.tests
}

output "tests" {
  value = imagetest_tests.dockerindocker
}
