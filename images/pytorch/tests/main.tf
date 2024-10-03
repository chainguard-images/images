terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

// NOTE: Until a time in the near future when we support GPU enabled harnesses,
// the tests below are benign and only serve to signal to the sharder how to
// handle this image.
data "imagetest_inventory" "this" {}

resource "imagetest_harness_docker" "this" {
  name      = "pytorch"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_docker.this
  name        = "Placeholder"
  description = "Placeholder"

  steps = [
    {
      name = "Placeholder"
      cmd  = "exit 0"
    },
  ]

  labels = {
    type = "container"
    # Group this image into a pytorch only shard
    "shard::group" = "pytorch"
  }
}

/*
locals { parsed = provider::oci::parse(var.digest) }

data "imagetest_inventory" "this" {}

resource "imagetest_harness_k3s" "this" {
  name      = "pytorch"
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

module "helm" {
  source = "../../../tflib/imagetest/helm"

  name      = "pytorch"
  namespace = "pytorch"
  repo      = "https://charts.bitnami.com/bitnami"
  chart     = "pytorch"
  timeout   = "20m"

  values = {
    containerName = "pytorch"
    image = {
      registry   = local.parsed.registry
      repository = local.parsed.repo
      digest     = local.parsed.digest
    }
    containerSecurityContext = {
      runAsUser                = 0
      runAsGroup               = 0
      runAsNonRoot             = false
      allowPrivilegeEscalation = true
      readOnlyRootFilesystem   = false
    }
    resourcesPreset = "none"
    volumePermissions = {
      resourcesPreset = "none"
    }
    persistence = {
      size = "2Gi"
    }
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic"
  description = "Basic functionality of the Pytorch Helm chart."

  steps = [
    {
      name = "Helm install"
      cmd  = module.helm.install_cmd
    },		
    {
      name    = "Pytorch Helm tests"
      workdir = "/tests"
      cmd     = <<EOF
        ./check-pytorch.sh
      EOF
    },
  ]

  labels = {
    type = "k8s"
  }

  timeouts = {
    // Set an upper limit for all other ops. This image is huge.
    create = "30m"
  }
}
*/
