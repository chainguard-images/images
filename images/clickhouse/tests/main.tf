terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_docker" "this" {
  name      = "clickhouse"
  inventory = data.imagetest_inventory.this
  envs = {
    IMAGE_REF = var.digest
  }
}

resource "imagetest_feature" "basic" {
  name    = "Smoke test"
  harness = imagetest_harness_docker.this

  steps = [
    {
      name = "--version"
      cmd  = "docker run --rm $IMAGE_REF local --version"
    },
    {
      name = "Setup sandbox"
      cmd  = <<EOF
apk add uuidgen
echo "clickhouse-$(uuidgen)" > /run/container_name
EOF
    },
    {
      name = "Start container",
      cmd  = <<EOF
docker run --rm -d --name=$(cat /run/container_name) -u 101:101 $IMAGE_REF server -- --listen_host 0.0.0.0
EOF
    },
    {
      name  = "Run version query",
      cmd   = <<EOF
echo 'SELECT version()' | docker run -i --rm --network=container:$(cat /run/container_name) cgr.dev/chainguard/curl:latest "http://localhost:8123/?query=" -s -w '%%{http_code}' --data-binary @- | grep 200
EOF
      retry = { attempts = 5, delay = "1s", factor = 2 }
    }
  ]

  after = [{
    cmd = "docker stop $(cat /run/container_name)"
  }]
}
