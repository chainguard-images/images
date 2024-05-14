terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_docker" "this" {
  name      = "mlflow"
  inventory = data.imagetest_inventory.this

  mounts = [{
    source      = path.module
    destination = "/tmp/tests"
  }]

  envs = {
    "IMAGE_NAME" : var.digest
    "WORKING_DIR" : path.module
  }
}

resource "imagetest_feature" "basic" {
  name    = "Test MLflow"
  harness = imagetest_harness_docker.this

  steps = [{
    name = "Import MLflow"
    cmd  = <<EOF
      docker run --rm $IMAGE_NAME -m mlflow
    EOF
    }, {
    name = "Check MLflow Tracking availability"
    cmd  = "/tmp/tests/check-mlflow.sh"
    }, {
    name = "MLflow integration tests"
    cmd  = <<EOF
      #!/usr/bin/env bash
      cat /tmp/tests/mlflow_tracking.py | docker run -i --rm $IMAGE_NAME
      cat /tmp/tests/linear_regression.py | docker run -i --rm $IMAGE_NAME
      cat /tmp/tests/plot.py | docker run -i --rm $IMAGE_NAME
    EOF
  }]
}
