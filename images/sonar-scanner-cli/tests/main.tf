terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "inventory" {}

locals { parsed = provider::oci::parse(var.digest) }

resource "imagetest_harness_docker" "basic" {
  name      = "cli"
  inventory = data.imagetest_inventory.inventory

  envs = {
    IMAGE_NAME : var.digest
  }
  mounts = [
    {
      source      = path.module
      destination = "/tests"
    }
  ]
}

resource "imagetest_feature" "run" {
  name        = "cli run"
  description = "run the cli"
  harness     = imagetest_harness_docker.basic

  steps = [
    {
      name = "run a scan"
      cmd  = <<EOT
        SONARQUBE=$(docker run --rm -d sonarqube)
        sleep 30
        TMPDIR=$(mktemp -d)
        cd $TMPDIR

        cp /tests/src/HelloWorld.java .
        docker run --rm -v $TMPDIR:/usr/src --user root --network container:$SONARQUBE $IMAGE_NAME -Dsonar.login=admin -Dsonar.password=admin -Dsonar.projectKey=default -X |grep "SUCCESSFUL"
        docker rm -f sonarqube
EOT
    }
  ]

  labels = {
    type = "container",
  }
}
