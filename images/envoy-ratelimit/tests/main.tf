terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "oci_string" "ref" { input = var.digest }

# TODO: Convert this to imagetest_harness_container when ready
data "oci_exec_test" "runs" {
  digest = var.digest
  script = "${path.module}/runs.sh"
}

data "imagetest_inventory" "this" {}

resource "imagetest_container_volume" "volume" {
  name      = "scratch-volume"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_harness_docker" "this" {
  name      = "envoy-ratelimit-container"
  inventory = data.imagetest_inventory.this

  mounts = [
    {
      source      = path.module
      destination = "/tests"
    }
  ]

  volumes = [
    {
      source      = imagetest_container_volume.volume
      destination = "/data"
    }
  ]

  envs = {
    VOLUME_NAME : imagetest_container_volume.volume.id
    IMAGE_NAME : var.digest
  }
}

resource "imagetest_feature" "container_runs" {
  name        = "container runs"
  description = "verifies that the envoy-ratelimit container runs"
  harness     = imagetest_harness_docker.this

  steps = [
    {
      name = "Prepare folders"
      cmd  = <<EOT
cp -r /tests /data
EOT
    },
    {
      name = "Run test"
      cmd  = <<EOT
docker run --rm -v $VOLUME_NAME:/data $IMAGE_NAME 2>&1 | grep "creating redis connection error"
EOT
    }
  ]

  labels = {
    type = "container"
  }
}

resource "imagetest_harness_k3s" "this" {
  name      = "envoy-ratelimit-k3s"
  inventory = data.imagetest_inventory.this

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }
}

module "helm_istio" {
  source    = "../../../tflib/imagetest/helm"
  chart     = "base"
  repo      = "https://istio-release.storage.googleapis.com/charts"
  name      = "istio-base"
  namespace = "istio-system"
}

module "helm_ratelimit" {
  source = "../../../tflib/imagetest/helm"
  repo   = "https://xyctruth.github.io/istio-ratelimit"
  chart  = "istio-ratelimit"
  name   = "ratelimit"
  values = {
    ratelimit = {
      # Needed to pick up the right redis endpoint
      fullnameOverride = "ratelimit"
      image = {
        repository = data.oci_string.ref.registry_repo
        tag        = data.oci_string.ref.pseudo_tag
      }
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the image."

  steps = [
    {
      name = "Helm install istio"
      cmd  = module.helm_istio.install_cmd
    },
    {
      name = "Helm install ratelimit"
      cmd  = module.helm_ratelimit.install_cmd
    },
  ]

  labels = {
    type = "k8s"
  }
}
