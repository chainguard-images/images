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

// TODO: Run a simple Docker test to verify the image is working.

resource "imagetest_harness_docker" "docker" {
  name      = "docker"
  inventory = data.imagetest_inventory.inventory

  envs = {
    IMAGE_NAME : var.digest
  }
}

resource "imagetest_feature" "test" {
  name    = "docker-test"
  harness = imagetest_harness_docker.docker

  steps = [{
    name = "basic test"
    cmd  = "docker run --rm $IMAGE_NAME version"
  }]
}

// TODO: Run a simple K8s test to verify the image is working.

resource "imagetest_harness_k3s" "k3s" {
  name      = "k3s"
  inventory = data.imagetest_inventory.inventory

  sandbox = {
    mounts = [
      {
        source      = path.module
        destination = "/tests"
      }
    ]
  }
}

locals { parsed = provider::oci::parse(var.digest) }

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name  = "TODO"
  chart = "TODO"

  values = {
    image = {
      repository = local.parsed["TODO"].registry_repo
      tag        = local.parsed["TODO"].pseudo_tag
    }
  }
}

resource "imagetest_feature" "helm" {
  name        = "helm-test"
  description = "Basic Helm test"
  harness     = imagetest_harness_k3s.k3s

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },
    {
      name = "Verify installation"
      cmd  = <<EOF

      TODO: Add a test here to verify the installation.

      EOF
    }
  ]

  labels = {
    type = "k8s"
  }
}
