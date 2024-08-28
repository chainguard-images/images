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
  name      = "jellyfin"
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
      name = "Setup sandbox"
      cmd  = <<EOF
apk add uuidgen
echo "jellyfin-$(uuidgen)" > /run/container_name
EOF
    },
    {
      name = "Start container",
      cmd  = <<EOF
docker run -d --rm --name=$(cat /run/container_name) $IMAGE_REF
EOF
    },
    {
      name  = "Check jellyfin /health",
      cmd   = <<EOF
docker run --rm --network=container:$(cat /run/container_name) \
  cgr.dev/chainguard/curl:latest --fail http://localhost:8096/health
EOF
      retry = { attempts = 5, delay = "1s", factor = 2 }
    }
  ]

  after = [{
    cmd = "docker stop $(cat /run/container_name)"
  }]
}