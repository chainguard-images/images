terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_exec_test" "build" {
  digest = var.digest
  script = "${path.module}/check-teleport.sh"
}

# data "imagetest_inventory" "this" {}

# I tried this but it didn't work because the volume mapping didn't work somehow?
# the issue was the error says "teleport.yaml is directory" but it's not, it's a file.

# resource "imagetest_harness_docker" "docker" {
#   name      = "teleport-docker"
#   inventory = data.imagetest_inventory.this

#   mounts = [{
#     source      = path.module
#     destination = "/tests"
#   }]

#   envs = {
#     IMAGE_NAME : var.digest
#   }
# }

# resource "imagetest_feature" "basic" {
#   name        = "basic"
#   description = "Basic test for Teleport"
#   harness     = imagetest_harness_docker.docker

#   steps = [{
#     name = "Test Teleport"
#     cmd  = "/tests/check-teleport.sh"
#   }]

#   labels = {
#     type = "container"
#   }
# }

# We cannot run the Helm tests ATM because it expects a variable called `teleportVersionOverride` to be set in format `vX.Y.Z` which is what we don't support in tests.
# Ref: https://goteleport.com/docs/deploy-a-cluster/helm-deployments/kubernetes-cluster/
