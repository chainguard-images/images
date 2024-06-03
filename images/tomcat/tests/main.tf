terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

locals {
  war_url = "https://tomcat.apache.org/tomcat-10.1-doc/appdev/sample/sample.war"
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "this" {}

# resource "imagetest_harness_k3s" "this" {
#   name      = "tomcat_k3s"
#   inventory = data.imagetest_inventory.this

#   sandbox = {
#     mounts = [{
#       source      = path.module
#       destination = "/tests"
#     }]

#     envs = {
#       "IMAGE_NAME" : var.digest
#       "NS" : "tomcat"
#       "WAR_URL" : local.war_url
#     }
#   }
# }

# resource "imagetest_feature" "k3s" {
#   name    = "Test Tomcat"
#   harness = imagetest_harness_k3s.this

#   steps = [{
#     name = "Run sample app in kubernetes"
#     cmd  = "/tests/smoke.sh"
#   }]
# }

resource "imagetest_harness_docker" "this" {
  name      = "tomcat_docker"
  inventory = data.imagetest_inventory.this

  mounts = [{
    source      = path.module
    destination = "/tests"
  }]

  envs = {
    "IMAGE_NAME" : var.digest
    "WORKING_DIR" : path.module
    "WAR_URL" : local.war_url
  }
}

resource "imagetest_feature" "docker" {
  name    = "Test Tomcat"
  harness = imagetest_harness_docker.this

  steps = [
    {
      name = "Run sample app"
      cmd  = <<EOF
        PORT=$(shuf -i 1024-65535 -n 1)
        TMPDIR="$(mktemp -d)"
        apk add curl
        curl -sSL -o "$TMPDIR/sample.war" $WAR_URL
        CONTAINER=$(docker run -p "$PORT:8080" -d --rm $IMAGE_NAME)
        docker cp "$TMPDIR/sample.war" $CONTAINER:/usr/share/tomcat/webapps/
    EOF
    },
    {
      name = "Sample app works"
      cmd  = "curl http://localhost:$PORT/sample/ | grep 'Hello, World'"
      retry = {
        delay    = "3s"
        attempts = 3
      }
  }]
}

