terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
    oci       = { source = "chainguard-dev/oci" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "inventory" {
}

resource "random_id" "id" {
  byte_length = 4
}

resource "imagetest_harness_docker" "docker" {
  envs = {
    IMAGE_NAME : var.digest
    WP_CONTAINER_NAME : "wordpress-${random_id.id.hex}"
  }
  inventory = data.imagetest_inventory.inventory
  name      = "docker-wordpress"
}

resource "imagetest_feature" "wordpress-basic" {
  harness = imagetest_harness_docker.docker
  name    = "docker-test-wordpress"
  steps = [{
    name = "Start up WordPress container"
    cmd  = <<EOT
docker run --detach --rm --name "$WP_CONTAINER_NAME" $IMAGE_NAME
EOT
    }, {
    name  = "Check Logs"
    cmd   = <<EOT
docker logs "$WP_CONTAINER_NAME" 2>&1 | grep -q "ready to handle connections"
EOT
    retry = { attempts = 15, delay = "30s" }
    }, {
    name = "stop container"
    cmd  = <<EOT
docker stop $WP_CONTAINER_NAME
EOT
  }]
}

