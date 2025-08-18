terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "warn_on_failure" {
  description = "Whether to fail or warn if the test fails. Used only for EOL images."
  default     = false
}

variable "check-dev" {
  default     = false
  description = "Whether to check for dev extensions"
}

variable "prod_digest" {
  description = "The production (non-dev) image digest for multistage testing."
  default     = ""
}

variable "target_repository" {
  description = "The target repository for the test harness"
}

variable "image_type" {
  description = "The type of the Python image being tested (dev vs non-dev)"
}

module "bash_sandbox" {
  source            = "../../../tflib/imagetest/sandboxes/bash"
  target_repository = var.target_repository
}

module "dind_test" {
  source = "../../../tflib/imagetest/tests/docker-in-docker"
  name   = var.image_type

  images = {
    python      = var.digest
    python_prod = var.prod_digest != "" ? var.prod_digest : var.digest
  }

  tests = [
    {
      name    = "comprehensive"
      image   = module.bash_sandbox.image_ref
      content = [{ source = path.module }]
      cmd     = "./comprehensive-tests.sh"
      envs    = var.check-dev ? {} : { SKIP_TEST = "true" }
    },
  ]
}
