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

variable "k3s-image" {
  description = "k3s image that we should use"
  type        = string
  # TODO(joshrwolf): use our image once incident is resolved: https://chainguard-dev.slack.com/archives/C08RVPMBENP
  default = "mirror.gcr.io/rancher/k3s:latest"
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

resource "imagetest_tests" "k3sindocker" {
  name   = var.name
  driver = "k3s_in_docker"

  drivers = {
    k3s_in_docker = {
      image = "${var.k3s-image}"
      registries = {
        "docker.io" = {
          mirrors = {
            endpoints = ["https://mirror.gcr.io"]
          }
        }
      }
    }
  }

  images = var.images

  tests = local.tests
}

output "tests" {
  value = imagetest_tests.k3sindocker
}
