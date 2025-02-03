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

# TODO: We can remove this if we ever make docker-dind public
variable "dind_image" {
  description = "The dind image to use."
  default     = "cgr.dev/chainguard-private/docker-dind:latest"
}

variable "tests" {
  description = "The list of tests to run with the docker in docker driver."
  type = list(object({
    name  = string
    image = string
    cmd   = string
    content = list(object({
      source = string
    }))
    envs = optional(map(string), null)
  }))
}

resource "imagetest_tests" "dockerindocker" {
  name   = var.name
  driver = "docker_in_docker"

  drivers = {
    docker_in_docker = {
      image = var.dind_image
    }
  }

  images = var.images

  tests = var.tests
}

