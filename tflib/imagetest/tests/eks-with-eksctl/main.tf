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

variable "repo" {
  description = "The repository to push the images to. Should normally be ECR for this driver."
  type        = string
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

resource "imagetest_tests" "ekswitheksctl" {
  name   = var.name
  driver = "eks_with_eksctl"

  repo = var.repo

  drivers = {
    eks_with_eksctl = {}
  }

  images = var.images

  tests = var.tests
}
