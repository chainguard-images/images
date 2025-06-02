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

variable "image_version" {}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "${var.image_version}-k3s"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [{
      source      = path.module
      destination = "/tests"
    }]

    envs = {
      "IMAGE_NAME" : var.digest
      "NS" : "tomcat"
      "WAR_URL" : local.war_url
    }
  }
}

resource "imagetest_feature" "k3s" {
  name    = "Test Tomcat"
  harness = imagetest_harness_k3s.this

  steps = [{
    name = "Run sample app in kubernetes"
    cmd  = "/tests/smoke.sh"
  }]
}

resource "imagetest_harness_docker" "this" {
  name      = "${var.image_version}-docker"
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
        TMPDIR="$(mktemp -d)"
        apk add curl
        curl -sSL -o "$TMPDIR/sample.war" $WAR_URL
        CONTAINER=$(docker run -d --rm $IMAGE_NAME)
        docker cp "$TMPDIR/sample.war" $CONTAINER:/usr/share/tomcat/webapps/
        sleep 3 # auto-deploy war
        docker run --rm --network container:$CONTAINER cgr.dev/chainguard/curl:latest http://localhost:8080/sample/ | grep 'Hello, World'
        docker rm -f $CONTAINER
      EOF
  }]
}

