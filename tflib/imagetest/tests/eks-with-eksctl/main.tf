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

resource "imagetest_tests" "ekswitheksctl" {
  name   = var.name
  driver = "eks_with_eksctl"

  repo = var.repo

  drivers = {
    eks_with_eksctl = {}
  }

  images = var.images

  tests = local.tests
}
