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

variable "instance_type" {
  description = "Type of the instance that will be used"
  default     = "g5g.2xlarge"
}

variable "aws_ec2_ami" {
  description = "The AMI to use for the EC2 virtual machine."
  type        = string
  # Canonical's Ubuntu 24.04, arm64
  default = "ami-0a19bfd91e88a454b"
}

variable "aws_region" {
  description = "The AWS region to use for the tests."
  type        = string
  default     = "us-west-2"
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

variable "driver_config" {
  description = "Optional ec2 driver configuration. The full supported configuration is documented here: https://registry.terraform.io/providers/chainguard-dev/imagetest/latest/docs/resources/tests#nested-schema-for-driversec2"
  type        = any
  default     = {}
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


resource "imagetest_tests" "ec2" {
  name   = var.name
  driver = "ec2"

  drivers = {
    ec2 = merge({
      ami            = var.aws_ec2_ami
      instance_type  = var.instance_type
      mount_all_gpus = true
      region         = var.aws_region
    }, var.driver_config)
  }

  repo = var.repo

  images = var.images

  tests = local.tests
}
