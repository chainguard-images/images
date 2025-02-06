variable "digest" {
  description = "The image digest to run tests over."
}

variable "target_repository" {
  description = "The repository to push transient test images to."
}

module "bash_sandbox" {
  source            = "../../../tflib/imagetest/sandboxes/bash"
  target_repository = var.target_repository
}

module "test" {
  source = "../../../tflib/imagetest/tests/docker-in-docker"

  images = { static = var.digest }

  tests = [
    {
      name    = "multi dockerfile build test"
      image   = module.bash_sandbox.image_ref
      content = [{ source = path.module }]
      cmd     = "./test.sh"
    }
  ]
}

