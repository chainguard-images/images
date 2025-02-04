variable "digest" {
  description = "The image digest to run tests over."
}

variable "target_repository" {}

module "bash_sandbox" {
  source            = "../../../tflib/imagetest/sandboxes/bash"
  target_repository = var.target_repository
}

module "dind_test" {
  source = "../../../tflib/imagetest/tests/docker-in-docker"

  images = { busybox = var.digest }

  tests = [
    {
      name    = "basic functionality"
      image   = module.bash_sandbox.image_ref
      content = [{ source = path.module }]
      cmd     = "./test.sh"
    }
  ]
}

