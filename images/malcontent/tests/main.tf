terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "inventory" {
}

resource "imagetest_harness_docker" "docker" {
  envs = {
    IMAGE_NAME = var.digest
  }
  inventory = data.imagetest_inventory.inventory
  name      = "docker"
}

resource "imagetest_feature" "malcontent_analysis" {
  harness = imagetest_harness_docker.docker
  name    = "malcontent-analysis"
  steps = [
    {
      name = "run malcontent analysis"
      cmd  = "docker run --rm $IMAGE_NAME --ignore-self=false analyze /usr/bin/mal | tee /dev/stderr | grep -Ei 'RISK|DESCRIPTION|EVIDENCE'"
    }
  ]
}

