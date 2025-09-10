terraform {
  required_providers {
    imagetest = {
      source = "chainguard-dev/imagetest"
    }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "this" {}

resource "random_pet" "suffix" {}

resource "imagetest_container_volume" "volume" {
  name      = "kubectl-volume"
  inventory = data.imagetest_inventory.this
}

resource "imagetest_harness_docker" "docker" {
  name      = "docker"
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
    VOLUME_ID = imagetest_container_volume.volume.id
    IMAGE_NAME : var.digest
    PET_SUFFIX : random_pet.suffix.id
  }
}

resource "imagetest_feature" "image" {
  name        = "image"
  description = "Basic image test"
  harness     = imagetest_harness_docker.docker

  steps = [
    {
      name = "kubectl help"
      cmd  = "docker run --rm $IMAGE_NAME help"
    },
  ]

  labels = {
    type = "container"
  }
}

resource "imagetest_feature" "functional_tests" {
  name        = "functional-tests"
  description = "Runs functional tests inside a Docker container using K3d"
  harness     = imagetest_harness_docker.docker

  steps = [
    {
      name = "copy test files into workspace"
      cmd  = <<EOF
        cp -r /tests/test/* /test
        chown -R 65532:65532 /test
      EOF
    },
    {
      name = "Install K3d"
      cmd  = "apk add --no-cache k3d"
    },
    {
      name = "Create a custom docker network"
      cmd  = "docker network create $PET_SUFFIX-network"
    },
    {
      name = "Create Unique K3d Cluster"
      cmd  = "k3d cluster create $PET_SUFFIX --network $PET_SUFFIX-network --k3s-arg='--snapshotter=native@all'"
    },
    {
      name = "Extract K3d Kubeconfig"
      cmd  = <<EOT
        k3d kubeconfig get $PET_SUFFIX > /test/config
        sed -i "s|server: https://0.0.0.0:[0-9]\\+|server: https://k3d-$PET_SUFFIX-server-0:6443|" /test/config
      EOT
    },
    {
      name = "Check Cluster Access"
      cmd  = "docker run --rm --network $PET_SUFFIX-network -v $VOLUME_ID:/test $IMAGE_NAME --kubeconfig=/test/config cluster-info"
    },
    {
      name = "List Pods"
      cmd  = "docker run --rm --network $PET_SUFFIX-network -v $VOLUME_ID:/test $IMAGE_NAME --kubeconfig=/test/config get pods -A"
    },
    {
      name = "Create Deployment"
      cmd  = "docker run --rm --network $PET_SUFFIX-network -v $VOLUME_ID:/test $IMAGE_NAME --kubeconfig=/test/config create deployment test-deploy --image=cgr.dev/chainguard/wolfi-base:latest -- sleep infinity"
    },
    {
      name = "Wait for Deployment Rollout"
      cmd  = "docker run --rm --network $PET_SUFFIX-network -v $VOLUME_ID:/test $IMAGE_NAME --kubeconfig=/test/config rollout status deployment/test-deploy"
    },
    {
      name = "Get Deployment Details"
      cmd  = "docker run --rm --network $PET_SUFFIX-network -v $VOLUME_ID:/test $IMAGE_NAME --kubeconfig=/test/config get deployment test-deploy -o yaml"
    },
    {
      name = "Patch Deployment with an Annotation"
      cmd  = "docker run --rm --network $PET_SUFFIX-network -v $VOLUME_ID:/test $IMAGE_NAME --kubeconfig=/test/config annotate deployment test-deploy test-annotation=\"updated\""
    },
    {
      name = "Check Deployment Annotations"
      cmd  = "docker run --rm --network $PET_SUFFIX-network -v $VOLUME_ID:/test $IMAGE_NAME --kubeconfig=/test/config get deployment test-deploy -o=jsonpath=\"{.metadata.annotations}\""
    },
    {
      name = "Delete Deployment"
      cmd  = "docker run --rm --network $PET_SUFFIX-network -v $VOLUME_ID:/test $IMAGE_NAME --kubeconfig=/test/config delete deployment test-deploy"
    }
  ]
  # Comment out the after block if debugging with IMAGETEST_SKIN_TEARDOWN=1
  after = [
    {
      name = "Delete K3d Cluster"
      cmd  = "k3d cluster delete $PET_SUFFIX"
    }
  ]
}
