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

variable "aws_eks_node_ami" {
  description = "The AMI to use for the EKS nodes."
  type        = string
  default     = "" // Default is to use the EKS default node image.
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
    envs       = optional(map(string), null)
    on_failure = optional(list(string), null)
  }))
}

variable "driver_config" {
  description = "Optional ekswitheksctl driver configuration. The full supported configuration is documented here: https://registry.terraform.io/providers/chainguard-dev/imagetest/latest/docs/resources/tests#nested-schema-for-driverseks_with_eksctl"
  type        = any
  default     = {}
}

variable "timeout" {
  description = "The maximum amount of time to wait for all tests to complete. This includes the time it takes to create and destroy the EKS cluster."
  type        = string
  default     = "30m"
}

locals {
  # System namespaces to exclude from on_failure diagnostics
  excluded_ns = "kube-system|kube-node-lease|kube-public"

  default_on_failure = [
    "kubectl get pods -A -l '!dev.chainguard.imagetest' --field-selector metadata.namespace!=kube-system -o wide",
    "kubectl get events -A --field-selector metadata.namespace!=kube-system --sort-by='.lastTimestamp'",
    "kubectl get ns --no-headers -o custom-columns=:metadata.name | grep -vE '${local.excluded_ns}' | xargs -I{} stern -n {} -l '!dev.chainguard.imagetest' --no-follow --tail 50",
    "kubectl get ns --no-headers -o custom-columns=:metadata.name | grep -vE '${local.excluded_ns}' | xargs -I{} kubectl logs -n {} -l '!dev.chainguard.imagetest' --all-containers --tail=50 --prefix --previous",
    "kubectl get svc,endpoints -A -l '!dev.chainguard.imagetest' --field-selector metadata.namespace!=kube-system",
    "helm list -A",
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

resource "imagetest_tests" "ekswitheksctl" {
  name   = var.name
  driver = "eks_with_eksctl"

  repo = var.repo

  drivers = {
    eks_with_eksctl = merge({
      node_ami = var.aws_eks_node_ami
      region   = var.aws_region
    }, var.driver_config)
  }

  images = var.images

  tests   = local.tests
  timeout = var.timeout
}
