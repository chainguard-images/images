terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

variable "is-dev" {
  default     = false
  description = "The type of image."
}

data "imagetest_inventory" "inventory" {}

resource "random_id" "id" {
  byte_length = 4
}

resource "imagetest_harness_docker" "docker" {
  name      = "docker-wordpress"
  inventory = data.imagetest_inventory.inventory

  envs = {
    IMAGE_NAME : var.digest
    WP_CONTAINER_NAME : "wordpress-${random_id.id.hex}"
    WP_ENV : var.is-dev ? "development" : "production"
    WORDPRESS_DB_HOST : "test"
    WORDPRESS_DB_USER : "wp-user"
    WORDPRESS_DB_PASSWORD : "wp-password"
    WORDPRESS_DB_NAME : "wordpress"
  }
}

resource "imagetest_feature" "wordpress-basic" {
  name    = "docker-test-wordpress"
  harness = imagetest_harness_docker.docker

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

resource "imagetest_feature" "wordpress-entrypoint" {
  count   = var.is-dev ? 1 : 0
  name    = "docker-test-wordpress-entrypoint"
  harness = imagetest_harness_docker.docker

  steps = [{
    name = "Execute entrypoint"
    cmd  = <<EOT
docker run --detach --rm --name "$WP_CONTAINER_NAME" --entrypoint /usr/local/bin/docker-entrypoint.sh $IMAGE_NAME php-fpm
EOT
    }, {
    name = "Verify Document Root is Set"
    cmd  = <<EOT
docker exec "$WP_CONTAINER_NAME" ls /var/www/html | grep -q index.php
EOT
    }, {
    name = "Verify wp-config.php is Present"
    cmd  = <<EOT
docker exec "$WP_CONTAINER_NAME" ls /var/www/html | grep -q wp-config.php
EOT
    }, {
    name = "stop container"
    cmd  = <<EOT
docker stop $WP_CONTAINER_NAME
EOT
    }
  ]
}
