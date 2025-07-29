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

resource "imagetest_container_volume" "volume" {
  name      = "pytorch-volume"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_harness_docker" "this" {
  name      = "pytorch"
  inventory = data.imagetest_inventory.this

  mounts = [{
    source      = path.module
    destination = "/tests"
  }]

  volumes = [{
    source      = imagetest_container_volume.volume
    destination = "/test"
  }]

  envs = {
    IMAGE_NAME = var.digest
    VOLUME_ID  = imagetest_container_volume.volume.id
  }
}

resource "imagetest_feature" "basic" {
  harness     = imagetest_harness_docker.this
  name        = "test-python-pytorch"
  description = "Test entrypoint and torch package"

  timeouts = {
    create = "120m"
  }

  steps = [
    {
      name = "copy test files into workspace"
      cmd  = <<EOF
        cp -r /tests/* /test
        chown -R 65532:65532 /test
      EOF
    },
    {
      name = "Is this an expected CUDA variant for this PyTorch release?"
      cmd  = <<EOT
docker run --rm -v $VOLUME_ID:/test $IMAGE_NAME /test/expected-cuda-variant.py
EOT
    },
    {
      name = "Test default Python entrypoint works"
      cmd  = <<EOT
docker run --rm $IMAGE_NAME --version | grep Python
EOT
    },
    {
      name = "Test python symlink works"
      cmd  = <<EOT
docker run --entrypoint /usr/bin/python --rm $IMAGE_NAME --version | grep Python
EOT
    },
    {
      name = "Test python3 symlink works"
      cmd  = <<EOT
docker run --entrypoint /usr/bin/python3 --rm $IMAGE_NAME --version | grep Python
EOT
    },
    {
      name = "Test torch package can be loaded"
      cmd  = <<EOT
docker run --rm $IMAGE_NAME -c 'import torch'
EOT
    },
    {
      name = "Test torch.rand function"
      cmd  = <<EOT
docker run --rm $IMAGE_NAME -c 'import torch ; print(torch.rand(5, 3))' | grep tensor
EOT
    },
  ]

  labels = {
    type = "container"
    # Group this image into a pytorch only shard
    "shard::group"         = "pytorch"
    "gha::runs-on"         = "ubuntu-latest-64-cores"
    "gha::timeout-minutes" = "240"
  }
}

//
// The following test has been commented out since inception, and currently
// fails with:
// ⚠ ERROR: Original containers have been substituted for unrecognized ones.
// It needs to be debugged or removed.
//

/*
locals { parsed = provider::oci::parse(var.digest) }

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

resource "imagetest_feature" "basic_helm" {
  harness     = imagetest_harness_k3s.this
  name        = "Basic Helm"
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
