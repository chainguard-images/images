terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

resource "imagetest_tests" "bcfips_break" {
  name   = var.name
  driver = "docker_in_docker"

  drivers = {
    docker_in_docker = {
      image   = "cgr.dev/chainguard/docker-dind:latest"
      mirrors = ["https://mirror.gcr.io"]
    }
  }

  images = {
    test_image = var.digest
  }

  tests = [
    {
      name  = "break-bcfips-test"
      image = var.bash_sandbox_image != "" ? var.bash_sandbox_image : "cgr.dev/chainguard/bash:latest-dev"
      cmd   = "./test-break-bcfips.sh"
      content = [
        {
          source = path.module
        },
        {
          source = "${path.module}/../libs"
          target = "/imagetest/libs"
        }
      ]
      envs = {
        ENTRYPOINT_ARGS        = var.entrypoint_args
        ENV_VARS               = var.env_vars
        CONTAINER_NAME         = var.container_name
        ENTRYPOINT             = var.entrypoint
        EXPECTED_PANIC_MESSAGE = var.expected_panic_message
      }
    }
  ]
}

output "tests" {
  value = imagetest_tests.bcfips_break
}
