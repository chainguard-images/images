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

resource "imagetest_tests" "k3sindocker" {
  name   = var.name
  driver = "k3s_in_docker"

  drivers = {
    k3s_in_docker = {}
  }

  images = var.images

  tests = var.tests
}
