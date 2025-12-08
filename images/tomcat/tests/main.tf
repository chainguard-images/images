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

locals {
  war_url = "https://tomcat.apache.org/tomcat-10.1-doc/appdev/sample/sample.war"
}

variable "image_version" {}

module "k3s_test" {
  source = "../../../tflib/imagetest/tests/k3s-in-docker/"
  name   = var.image_version

  images = { tomcat = var.digest }
  cwd    = path.module

  tests = concat(
    [{
      name  = "Kubernetes tests"
      image = module.bash_sandbox.image_ref
      cmd   = "./k3s-smoke.sh"
      envs = {
        WAR_URL : local.war_url
      }
    }],
  )
}

module "docker_test" {
  source = "../../../tflib/imagetest/tests/docker-in-docker"

  images = { tomcat = var.digest }

  tests = [{
    name    = "Smoke tests"
    image   = module.bash_sandbox.image_ref
    content = [{ source = path.module }]
    cmd     = "./docker-smoke.sh"
    envs = {
      WAR_URL : local.war_url
    }
  }]
}
